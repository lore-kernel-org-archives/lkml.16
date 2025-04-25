Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882CB22068B;
	Fri, 25 Apr 2025 20:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611549; cv=none; b=pQ+hkmeOTqF5C01zpwlUxpsoFE5wEFjMjJDLzQOMqsmoZjuuERco3nVP3a0teudBcIbneDRiipJY+/ER3UlFKGRy5Xr5zkovhdjwYyc6h7MUf3tMQM1CYKYxC39lBpcTvTZ9mS4hsMRJYlW2SvmSZ8d6epk/vup3ISFD1XfMUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611549; c=relaxed/simple;
	bh=5BQ0LUg6W5yifs+8zhUEaKDVX1DslXZgeFTX4WLSDj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4u1emlIRrZUpj13/wM/PFCqUqBN84ABa+POJ1I2ohmUMGB9QKzZbnkwuFuCQ+CHqGUJoZ4oxLIib0hW5Zcl15tu1P+ifsMyOpAGJKtCcerIJT2nRN0r4Hm3anEj7FkS/Tshq1xyzaOK/2UdzPYks2sj+JfRQzYfJ8Ki4z8XE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFheYrhT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFheYrhT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE40AC4CEE4;
	Fri, 25 Apr 2025 20:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745611549;
	bh=5BQ0LUg6W5yifs+8zhUEaKDVX1DslXZgeFTX4WLSDj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFheYrhTeno44k6W7DzkL4UbKZHET/AA+stPKGWxGlJT5xTnLfAZXxMXQ0CpAhsDS
	 +BQPPjPQ6YqH/jqyuJhWx+VaaHVKESNAAv6SNSSI3QlAuKxYfudFGiwuQ6xdGfOmBP
	 qGxTLsguR+4/PFXYj8NZ2wo0wFDJuJBMTg5M5Vinpv0yuhodWq2nvbwf+2sJnF497W
	 BNeESMVmP0lkvyrKrb0SPRpIfw2v5s7/CvmMHWjy4udABF7SqxBVNMtZL+jOuyo7vX
	 XugiiCSz0DqSTGT52zG6TmuX5GpqL+tsGByA5KMma5jhp4u8Y6KxKYijAREP5ksxxr
	 7PC6PbFxIbStA==
Date: Fri, 25 Apr 2025 15:05:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: usb: Add binding for PS5511 hub
 controller
Message-ID: <174561154653.2910166.17841254906175097993.robh@kernel.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-3-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082957.2058229-3-treapking@chromium.org>


On Tue, 22 Apr 2025 16:28:28 +0800, Pin-yen Lin wrote:
> Parade PS5511 is USB hub with 4 USB 3.2 compliant 5Gbps downstream(DS)
> ports, and 1 extra USB 2.0 downstream port. The hub has one reset pin
> control and two power supplies (3V3 and 1V1).
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v3:
> - Remove redundant schemas
> - Update the schema for downstream ports and devices
> 
> Changes in v2:
> - Inherit usb-hub.yaml
> - Fix bindings to reject port@5/device@5 for 3.0 hub correctly
> - Minor string fixes
> 
>  .../bindings/usb/parade,ps5511.yaml           | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

