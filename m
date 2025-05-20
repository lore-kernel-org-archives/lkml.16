Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC922B8A6;
	Tue, 20 May 2025 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747211; cv=none; b=hGLWawK3+AWVbrZk5Q4LdVLVV1ngoU2B4X3vh7RT3oc1DolLrP5Khc9NxSBq7gPPPUcFEzKRMO/xbAF0aS88tm7KB9tczrqGsT3KIFqTTa8+v2vyNz2LDND/Gix2c7aIiVG4qlMVBXwbyEQqnHKCDqKoFGGZ2qD+5mUSJNySOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747211; c=relaxed/simple;
	bh=PAajpBtHg7IEQCKfa/GqYF7LqfYD+yrAARy661F5pBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NunDT+B++h5HruaaYdjMhca0vd3mk8SXgABHVbzrjPtGaLlKHPwQHb9gbTV+4i9HLX+xGGYCjYT5LOax4rqS9K/QZkiCqq0Ff1sSRf3VL46pBMLTg3dph9010Z3Q8OvPVFcsBCS8Bc3LRd+D+H+s8q9x9Oo393vjdZab7RD5AI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOkn7xq4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOkn7xq4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5089552b3a.1;
        Tue, 20 May 2025 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747747208; x=1748352008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AmFlD7LeNDo+Pj6uKzt376bGTNmLmJEsuyEQshyCW0=;
        b=SOkn7xq4VbOPIcjY37CHbuzwBp/qaMZ/tMrRUe6QtlXwNe4ntDkjZ8jzKp0Bwcp25S
         H4dG9G4i/WzICqHxBixUdzkJk42Mr2DKOu+efv49OrCTqYuheLg+vYnxNWvNFigwL5UM
         JJGFaKRM7LTbYyO5BEnUN09rRZFWufZtuONg+Q01euq7TJ3oXqxT2aZ+uizi86EE3YnR
         flynT9xP3J5XUL8avcgi9XnGUmW7iOzsf3CgHhPrhESSQSWzSSyeb+RZ3mTFmgaA2mpN
         4hNcTYjf2KbrR1jbkn1sQ5no6eJKlHZv+3vPAhMBQfQGkJlx0wV3utqUQJZz+qW3YYIF
         8LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747208; x=1748352008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AmFlD7LeNDo+Pj6uKzt376bGTNmLmJEsuyEQshyCW0=;
        b=UBHrgLD/VzadVcLOIDPpbCh0hYadHcrrJEX6ZrMHYl5uqm3/uhhe+QnN34DoAAEDIZ
         hQn+SHvoPJ8MQdrnFFQ728gVs9odSR5CMg+5DxFXbEADC9L2OBg8CwhrClBXFWWL0sA8
         FuC/MQ0m7ov2dmkiKJDv4DMVCpTJ64saM1IZoEpEmMfk+pdvfqF5GWsfxM0BRNeQ6SUU
         MNIfcDlCQvr6nrRYp8Dqp5vk1Ib7JGbQgQtDrNEXFa7p0C13wLHgf3XvTMT8yRoZzY6Q
         efUXhVHpA7XDGSntoZnL9II5MRvQ4aJN686idn1tAO44RgAALsdaeUFT53gSeAen8cuy
         wfSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUramfntfmmADxHUbin4uS3baDwJ1uDbliFPL3rNZZxuqWEogRKEk7jZCM/aBrWphsoWA4QxzsDYc0=@vger.kernel.org, AJvYcCX14b0Ew1wizK2o+aqFNJjBNSpR38yn32jyxUHG9Jmo/4/B7AJIIK5z/zQrPRAC8NAPKfmARM6YmauMZxM=@vger.kernel.org, AJvYcCX8HtPgTqyHly5lEnEjp18QN4XznwnTnZTrSELOT70cD50PUNzGNjZxBZASyvRDQo/KFG81/8e9pfg+nCcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3wkp2jcaX4YnyOa7t7YTjlvMf+82DC02uPzSFAmr9+galHmF
	TdkNzNzufnULMr/Lhhh3NuhlTWAmwCYhxP4xaC3R0+eqRBaxAB5sYzLU
X-Gm-Gg: ASbGncu5OIqdaH2U82OMFLsRVtO/hTwAvi3kiRvy07kV8mAZsqgR3BulyP9qAXUm7wQ
	ek3Gqxcb0GtYLq1hi8qHQ0VYotrnYOgrr/eZgNAzs0xfGdEmYuP6itg4nyrZr9wB3TaEBfla4Zk
	HwhYvjDlwVzRpsZmxgHLU1hwih2qlkwtpl1L+I/QqSmjl5GVgkTN7pfm2VaGbnxcBdUf01DyVX0
	AvQW1ntp+eMlRrzGbABiGQ38fWu3kyk1hgIl8qLGJ2LADTQSucBm27LmKO24q5cD3rUV9vFEhV5
	06qV6MFoPUn6JJ/OsgNVgOGOJ9V9aI/u4PE/ll4vQsysYASPPHp7SEviF/ng1N+j
X-Google-Smtp-Source: AGHT+IE12mS50hMQe3RKrvq9b7waluhHdolkp17k3XQDoWNFPN6raxQIdr0oFnW6keiuISrcz/TQpw==
X-Received: by 2002:a17:902:f650:b0:231:fd73:f8db with SMTP id d9443c01a7336-231fd73faf1mr179494355ad.30.1747747208564;
        Tue, 20 May 2025 06:20:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebac09sm75711325ad.184.2025.05.20.06.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:20:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 20 May 2025 06:20:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shinji Nomoto <fj5851bi@fujitsu.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
Message-ID: <442b9b9c-37a0-494c-9930-e93278a73187@roeck-us.net>
References: <20250520062707.1657667-1-fj5851bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520062707.1657667-1-fj5851bi@fujitsu.com>

On Tue, May 20, 2025 at 03:27:04PM +0900, Shinji Nomoto wrote:
> To enable the power capping feature of the acpi_power_meter driver on
> systems other than IBM products, you must explicitly specify
> the force_cap_on module parameter.
> 
> Add information to the documentation about enabling the power capping
> feature with this driver, including the above, to improve user convenience.
> 
> Signed-off-by: Shinji Nomoto <fj5851bi@fujitsu.com>

Applied.

Thanks,
Guenter
