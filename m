Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9C221F37;
	Thu,  3 Jul 2025 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528066; cv=none; b=SHd6OnyoogtBsqNl+4ESfw8I4i7PVs+aUWjMdwmFXB3fk/qqrUWv15LdytayUv7tV3Zml06/gcfd4mp8/3azGeeP+vKXignE46nHja7DuCwVGWk7noQqxeonYo/hwGdITp0kA2Ak/eWOPzREu1y8mgPkL76mYlZ7dYYRcv8yf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528066; c=relaxed/simple;
	bh=OXyik24k6kEHjjfox8LkK4QShsZAoRfkfhgqrU9IJl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/J+SWIgUtJiktNBkFEEar5jXNMDS1+wou4C8cTzQ6otMhQHsdnd3P7//HF2Mapvzl0can6pcEZoDvloGW6Ntaut0a1k5QHBrkepgFR5oT3oxOYMcytfHY+tgXvR2VJGX/cjd4a9o6bgHNMq7hKCUkGbGGvUZWbQBLMAtLrqhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRbh2hny; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRbh2hny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33281C4CEE3;
	Thu,  3 Jul 2025 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528065;
	bh=OXyik24k6kEHjjfox8LkK4QShsZAoRfkfhgqrU9IJl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRbh2hnyPLNIUvbVN+dKD4dpSHP1jkXtOKEQhOYhewBfdLVbPijuwM0vJTyifbAlX
	 ClcOFM5+jF1k3nV+Gny/H3IOECsD0Cuw8c11bQphQk6uev3tmpCI+DDB+zewc0EEZ0
	 uPhumR1VJzuc9OO/LyCrwx5K5qutzd+LcK9/kwoTEuMMfx3f7gpYJFDTEjOYOU35/c
	 T/W3MaTS0ZSp04UKh0CDZiA1DyLMEU3OoBV9LVpkn0Xb1DoIQVNc1dEfLxtpvuJoCA
	 9wtkv4fFNb+zlKInHscdT6NJTJy9tWJ9ln8/WQPig0Vcc/OQEtZ6JeksDvgbSvqCLb
	 csC1r7unQrw5Q==
Date: Thu, 3 Jul 2025 09:34:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: Add MPS mp29502
Message-ID: <20250703-incredible-curious-snail-dcbc60@krzk-bin>
References: <20250701095625.1049917-1-wenswang@yeah.net>
 <20250701095930.1050234-1-wenswang@yeah.net>
 <20250701095930.1050234-3-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701095930.1050234-3-wenswang@yeah.net>

On Tue, Jul 01, 2025 at 05:59:29PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp29502 controller
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>

Just squash this with previous patch. Keep Ack.

Best regards,
Krzysztof

