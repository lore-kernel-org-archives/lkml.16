Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92509460;
	Wed, 23 Apr 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417018; cv=none; b=VoesJMs4iZjRSe+3GLf23t/eOfvN1JOls3akcEaHxKUxlloL9NHpY5YFT7KAaTs8lqyCkeN3QJYBl5gd83+feB/+AqvibpoVkf2rISSZALqjYqG1o/aAkaTD1PTp7Ie6PxfNKb3Ah9v08ifpWM8KY+hbcvejZUzY+w8NVBl21ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417018; c=relaxed/simple;
	bh=JMiBb+zS3fYzDT05tiFPjYsap9yUQQQP9Uzq9dFQ8Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN1JmD7EU/MxDA0EVfr/Bgr6qTgD5aVXnu1LRsfy+lGHSyUSGWW0NVJOr67UEMc14AbnNsxXz0PMhLgu4tTJKn2Nak32OyTuXfp7PguWX9qbv/8WXxtum1w//hNZFkYn/fxZlxU2vP+GAt/6usWjbsLctOkhOPI7BpovWv06038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT1NCN7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT1NCN7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CECC4CEE2;
	Wed, 23 Apr 2025 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745417018;
	bh=JMiBb+zS3fYzDT05tiFPjYsap9yUQQQP9Uzq9dFQ8Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT1NCN7HCs3p+RGalpS8t3HV0yZxPCHSXqCRJEI+mudKq6/ZARFdQvx1j7n+RU+8M
	 5kAXvJiZ2+j/xS5Cy2rqgt2UvNEZJ+kcJFSEJorY8igFXxwaBJs5iwkcIO/WaObVMw
	 N4XsZc53tPw4kZMPjBBSvwXS6fnP2oAUnGQG3ASWyFBjL4eoAJhw78nGQzPeOpP3eb
	 gStiIxu80GNp6WjN4JwUzZgwJaIL1BAjUntWw+BgyYsPaw1iDWJg5hXE2YeuYelTX4
	 GMqIjtU6CnuLjfmviBScBhCROsz32De46oOe8c3Cl7haJu+fOfPv9+180hm4UH3354
	 7B1+EJcf7SOmw==
Date: Wed, 23 Apr 2025 09:03:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp102: document optional V+
 supply property
Message-ID: <174541701572.358405.2954689215131157058.robh@kernel.org>
References: <20250417180426.3872314-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417180426.3872314-1-peter@korsgaard.com>


On Thu, 17 Apr 2025 20:04:25 +0200, Peter Korsgaard wrote:
> TMP102 is powered by its V+ supply, document it. The property is called
> "vcc-supply" since the plus sign (+) is not a valid property character.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

