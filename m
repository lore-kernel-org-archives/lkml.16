Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8D246768;
	Mon, 12 May 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068216; cv=none; b=m84k+apXxjHieS/T2gK7yIeST+/IMMPTxjBN9HDF0paImrivTQjztBWOyMrCFvwSp0dY+nAS3WuwlH4AIICtsUac4A4+Hv9HzJhVJgNIMLVDIOjq3pl16g7ONOXNDdy4X8UKGwpFjsnfQRJaqfZqdTlhO0WhY+28iWzt+yJEQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068216; c=relaxed/simple;
	bh=Vda+JOybyPKA8xTBF3SPHYQ7J6sne4i/SrVDTO5VA+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EucZcOs6KkR22ZXbkey/s/ENsPpuC8CemBzN2B6VjVQffVbdd9/qHyWyLJbkqDNDSTmRaZ4xrzaODJkb6KiwlSGT6R1zp7SCYDUWwqY4e8G8Io4l4VtrkbsDglc+ckt2Ws59WviMmc2DH4zqx0bJ+UQ3OTvFdEKCvYpekIbOQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWMMnhSj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWMMnhSj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso4640038b3a.1;
        Mon, 12 May 2025 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068214; x=1747673014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfXc2rWZIka8o9DYi6zkWse1Jp2IjsbDd/kGjumRxrs=;
        b=AWMMnhSjnVX8EVdFQIrVAV83+ZuHgBrzsi7Fgovk4lvAZZE0O2mDeOx9plh97YKWrF
         0oOR5ECC6DCtE7r1hrjHolz7K500ZqljZCMY6oVjBMYPjnyC2CYNzEI3gI1UeKwG/89H
         5KYlQieEJPCB4dNbe5swhBbg9hf8/OFOclXiM04W+g7KkE+D5pzwAaVZw1phNdwpiwUW
         Phm4jNWVA+s7OtOhxMVEi2YscVb4U9mViYHVgU0obB3a4NwN29w9JocNAzR2yTPOsyPJ
         tsc8SNjpBtCAI1AztAWNmV7F1e5NIlLu8hgJ+WEeRiX3CS7Eh/AKq+LJFF3iD2AMoh+T
         uZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068214; x=1747673014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfXc2rWZIka8o9DYi6zkWse1Jp2IjsbDd/kGjumRxrs=;
        b=B7Q3m7S281Px9iyAZ3QPAgHs3OIz6L8NMD/PvXM2EOW9cKkY3ykYfzvY3h2JaPgyte
         gV+/Tr8lMN0vZLV01Nu74MghCvUoDgjE+GhB66KsolA0vgi3BgBqBHKog5a+bWMPTj9K
         aeWSFSCODIZWytqh+Y9SKqAFTAiczcgsyVpeYNw36un9H6omV4PVtNg03HitzZ4oGuzW
         lKW/BC5DK5d2RAB13sKbzVdfNTjyUUMAIDl5JqtIHFr3Id9enjffk1TjIrT/zsgDroKa
         xDnEmIOpsSffXf8Jpv5yPWF2kr/uivaGtXKmhn29lSpdY1uK9HMqgyYfmnhytHAuCKRV
         pd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfRdYddG+56pLAOcocYQA2OZqEmSiM4WmQ7z7o0K+NG88yB2ufuXooYilGeTqcM080bw9bPX73717IH0kZ@vger.kernel.org, AJvYcCWhDhGhngPg+geW8Y7zo4BZZkmkhBlnfHa9GpgRN8EA6EPWYLsmBY1Xu2ZyT32QgJo3f5lMaCh2lLRb@vger.kernel.org, AJvYcCXQGyFDJisLhQZu6Er4m2MYWdB5gSUC2WRUej4AM5zp/NudWbAjl54//yHdvOZ7hr2MKuH3197oN+Iq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgb35EQI1s1iPv6kPI5VeIe1hzeFl6pKgvcIbsCdoiIGMI/OY
	yUwBdHTDpDsifymtAAxtn81jEbFNVPNPBCj7zQW+kx9jqVLtEnHk
X-Gm-Gg: ASbGncvkK7FiYE0wxYuEfmBAzaBfwSiK7wyi526/EBot5BXopU33vIjc9Uz3RPBCp7s
	mh1PwrtB/1K7mbzKHDvBL0nuSyuBl36JNx8ucDtj/AHUB2+bA2TRQPrqF2T9Q98aamiDjavWrx8
	smwV/gxC43Bizfe75OXMTUWQLg3gSfQpQvO0X9+nkCJQJUmKf/mwXQj2NcdT9ZiPV2DORi274hj
	vvcfP+fMSVcmeyD2WWEwDhxOuZGkOUrb0q87hOKe/ABfjkrw2NKUAH6KNKVs+KhZH8Kt86/0IoX
	IQCq6mNx5oQiU1Usqo2qkmhxfpelocsqfz+13haJLy+/ArN2LLBAydY47C9C1m/U
X-Google-Smtp-Source: AGHT+IFUxuYJr8AYFyPeuTZ1+0DRS+nrt6RHCC4WlG9U6UsRw+IAGWu/9C68tIIlaq+xDAMEJMu+NA==
X-Received: by 2002:a17:90b:2d06:b0:30a:2196:e654 with SMTP id 98e67ed59e1d1-30c3d2e1be3mr25354776a91.15.1747068213312;
        Mon, 12 May 2025 09:43:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b23681f33efsm5749400a12.7.2025.05.12.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:43:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:43:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/5] hwmon: pmbus: mpq8785: Implement VOUT feedback
 resistor divider ratio configuration
Message-ID: <c8be5e36-bd1b-4cf4-bd91-5cc701e99c79@roeck-us.net>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-4-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511035701.2607947-4-paweldembicki@gmail.com>

On Sun, May 11, 2025 at 05:55:46AM +0200, Pawel Dembicki wrote:
> Implement support for setting the VOUT_SCALE_LOOP PMBus register
> based on an optional device tree property
> "mps,vout-fb-divider-ratio-permille".
> 
> This allows the driver to provide the correct VOUT value depending
> on the feedback voltage divider configuration for chips where the
> bootloader does not configure the VOUT_SCALE_LOOP register.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Applied.

Thanks,
Guenter
