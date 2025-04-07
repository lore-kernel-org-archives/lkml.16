Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6EF20897F;
	Mon,  7 Apr 2025 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063080; cv=none; b=XrWlywyo1QjoFRLCnJKnkOxqTU7ckVBBrMz0SbwP+OfyNPbxW07Ft0mIpsjVsMqhX5cpW3fLxp0KhvrcySd7xryg8uDPWMqwtMV+ZMAF2XMrMj/K724AFDIG3EdSMijkBaoZiNSXW0jhMR1KAOSBiPKc441WjE8bC6xMtggA6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063080; c=relaxed/simple;
	bh=xvj+lvuBw1TbMx/NEN9QY0Pk1ROGSFMdHKlCdA1pCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTgPSMXPaI2FIPlFX0/osOuGhFgKSFlTOfoKhrSR1BZp+zJY3faFWCD11ngOczcMUyE/JdyBjUSdoN/gXZsiTr6wF0dqfCS2j9ejTO1WmYqbPURccZUwdt7YDLS3Qp3kU5EVyyt9bjXg8APGs0i1EMZVraTDv61FW17hVmAvWBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMsLQT8W; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMsLQT8W"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so3780729a91.2;
        Mon, 07 Apr 2025 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744063078; x=1744667878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/veMl5cJutbSFbAOBwrUVmNBffppxF3I3Y+pxxlSyY=;
        b=mMsLQT8WYoo5x6GNBhlYVzXdbbsW+VzRY/HlsmIxqnbTOczdKYfuev38BGHozxP7Tc
         fhtYPr0HZhcof+CTYnzym9idLeDnCtVKNJ1gCekn6lQvOoTzrkvVj2yz7ArfYSfsZdCx
         2CoS5tEf0xoD39TTAQk6x6YAI0l3ZIoVTtlehzqRdp1s3gIV7+mlIBxlMiXnusyomxIN
         sVYtR4WgZAOspAJTQQ605Dd0oHxeD0LZZbbFLDd9Y67vlGPlgQQsfTsyuMgRubQqFLNR
         LTubdrd4GH29BZsnhxeAAqTMYkyQHvaHgb7HHYaAgncaT4s2GlkH5WWEAjIleVFq90EJ
         SSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744063078; x=1744667878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/veMl5cJutbSFbAOBwrUVmNBffppxF3I3Y+pxxlSyY=;
        b=ImVqJLyP0LBFdOPxuV+JaB4u885Nx/gKbuo18wek3yj0JA8dJc2oyiNH3moRCf/HjA
         a4E81DTDtJrbdtMHIBLXqieNOtRMELGKUmy8DaxunVWisgoLhz7xrZQtAOwbQnFjMLoh
         /yCsk8v0DbFGckAGo2J3oqLE8N2L3cudhzHfrHJPumXlDMp3HPWPReZTkDuZQWg/XWis
         69VTFEH9Z8IwATljq3paNlLYiBpy1IlRCL2yYT90nN2+9HC56Ht4fF7qRiQwPKYxXzRb
         WAizlTHtxKs0v2xCcuLjYtGC34/ssukdVDf+E2DiqG2wpcU4Clhn94v5vwa1DGMlnOSj
         wE1w==
X-Forwarded-Encrypted: i=1; AJvYcCVqSMTYvEgm+GszAXMLKzzqdT2bULiVMNS5x5R6hmpTahDrZnHBspv1M5nBm4cyI0JAsCqvZlNsHtnEKQ==@vger.kernel.org, AJvYcCWhIBr7YVOZMNj5WEg+hhtCYFF9gQB+46oL5QPVasT01yH02BcF2MhCOE/cQEqBTSLWve+8AcVYflsx23Ij@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEc8dOP55VHrSOBLNCJAitIWJNrNMC8XWQ4OgFrgb3Hnjccuo
	hnzJ+KzD5IQ9bs6D24/rSHMvJwLsM/idurQIoa2hDBWfO+zsSjCitUYy9Q==
X-Gm-Gg: ASbGnctguyx4eHhLrbBiQtkcW5dwGu0Db3GyjLXgpgbF9HgHGvEuAxnZLaRMxoAHKC7
	AahrDKkHMC8+szmC2Bhw/UgJVgL4zOHWbLX0tFQFoCVykRry6Aft11S/dxApiZ6+VBybXTD87L1
	uWJrcsudS6pxzCpWNHqK6O4zp0B6zEX8x9/pQ1VRcE4aafiQvoZ1THRd64DKI1yERXSVkaqD8/k
	j1/WXCme0EnMZQAqizm6a1bxboKnixt77wc1Dt2DUkTD1lOQXCyvIxf/dNzGMbUnxEsclsSmf5g
	swxfJcqzf0+Pz4iFNQd1n2beCdMtQ3ms+tecxSj60RFEPOo23sFrUFFED3AfntupYeJ4
X-Google-Smtp-Source: AGHT+IGfIN/Tn2zcpNNxNhbVzCk6TRhMPHWB9OED8Dglm2of2mkcbNbnlggU8TM3GCAkI1G+Mx1uJg==
X-Received: by 2002:a17:90b:4ec7:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-306a4836fd7mr19970783a91.2.1744063077923;
        Mon, 07 Apr 2025 14:57:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306d2340f00sm129774a91.0.2025.04.07.14.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:57:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 14:57:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] hwmon: (pmbus): Introduce page_change_delay
Message-ID: <f650198f-159c-4793-8328-11b861c7f2ee@roeck-us.net>
References: <20250404193103.4174977-1-william@wkennington.com>
 <20250407201002.1198092-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407201002.1198092-1-william@wkennington.com>

On Mon, Apr 07, 2025 at 01:10:02PM -0700, William A. Kennington III wrote:
> We have some buggy pmbus devices that require a delay after performing a
> page change operation before trying to issue more commands to the
> device.
> 
> This allows for a configurable delay after page changes, but not
> affecting other read or write operations.
> 
> This makes a slight behavioral tweak to the existing delay logic, where
> it considers the longest of delays between operations, instead of always
> chosing the write delay over the access delay.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Applied.

Thanks,
Guenter
