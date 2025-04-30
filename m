Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA6156677;
	Wed, 30 Apr 2025 03:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983583; cv=none; b=N2BmNBfNlfIIhX75rxzfs5eYMm/l9hU0cTGLKNlRbRjCzjBlZheat8Fy0Hyk1wOzqfs+NweIPg2wRHPGaSMQgGyDBR6GJN+NSdD4NYAyQoe9O+mJyWZGMfPpJKI14Hjji5dB+6ikFeDmZwwswJmDdTKHyXG9at/61BqlMjC4Pno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983583; c=relaxed/simple;
	bh=0f5zSjI7euKU4fzDacN0WtI2ajnunsdrE2QY3GMibGY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KJjQVnlOZDBJUa61CJayBtrnJ9wtFul5nBgW1a78qcBy9j+V2dg672XFhyqL6322eIYQttDcqa3LA22LJsBeWxWEWriH7SvLg6O9VAtgTNKO/AAz7Man0idTWPRXecNmviQ+JsF4iNpvEITpPgVuyxwt+xRSHYzCMFWmamWronI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCwsF//o; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCwsF//o"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so68343115ad.2;
        Tue, 29 Apr 2025 20:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983582; x=1746588382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z6linA/lr0nmXcIVWFPX+1HBEKm/CCuzmP15Be91J/8=;
        b=QCwsF//oK8VQB3eSMUxDRui5o7WZmV/qs6atIWTNeZ1RbIzlF4bwesq6eFBIO4qiFj
         d/nUIt0+OzRSXPXY8Rv6+1yDtd51dzC7F8G0bEgGOeDjHOCSq8KXBWnKXJD9yemAKR2y
         r5tyOMsf5f0gMvWFR8iKwg65vzhDLgHTrXon7PomqsKo2TyO8pQBDKFIKJn5wIxwE4rp
         FCElRjCa5OMuyosA/E/lTpsGlUI0hnbx2AjNLwjd7HCpml9//B50koZ5WsXSEyw/P91t
         lP2cfHNG6DW+YaovNP8TWJhu8YPd/Px1MHHJlt3Pf5Mi3H+2Fs4od31sl2+g0lEFRUnz
         xWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983582; x=1746588382;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6linA/lr0nmXcIVWFPX+1HBEKm/CCuzmP15Be91J/8=;
        b=FXzrCDM53cLLQUnkq6fC8gqnINUOELbJsiKSLI+r7ZNV7BCDqIa9qZdgzzXu/O5yP/
         YIGZ/ySiHLaolYFdQAe0HOu7BjFXMyddU4QsfF6VIUmVuFKB7EaEafRdZqi9tBmYK42y
         g84dv9KCcVEwgMXvurz3uf4rWPzDKiPJLc460rw4l+17CClS6nLILXl8K9DNQbBxN9vY
         2mG0oWF69VWBUqzBixpJd0ckqFRZj54v5yMB9yG5Opx07091rHP98NQvYoY8wer4RyIa
         9RdLRZCJzUlasuNY/m7dtoFEqt7KCwnBWqMfWxWA6EYJA/Zy7KrKCMaU7bAMj6SSoOjV
         RfPA==
X-Forwarded-Encrypted: i=1; AJvYcCU05+0DOtunwdKSHWD+dtO8tA8As5YEO0MJUU1JT1RIOX0UZnVhzrhjhT3dADADwn+1Zd9d8jW2bRq6JKDp@vger.kernel.org, AJvYcCW4fBinUPnDA9mt+ppUAArYkA/brYZJcKZ5qtNtNDyIqLZoPJW26WsTus2n+d1xjN/REs2EDtoNK1d+FWVhMCq/fJYnSA==@vger.kernel.org, AJvYcCX49FPrkl9gYuoWHH3faMcGiOd9tGq05vXQOCoPvxzBmwZrIdjQoFeHbM/8Ax54bpqlRrS28rKDUYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOG0R+cNNW5XkPASPw5YHz0+ifJxSn8j65sLEWWCtGjdP+jV77
	c953TlAvg9933Zp4l8myEjga8eXWHjUBTOo2Za2McblSuMMXvago
X-Gm-Gg: ASbGnctvL6J2xPfpO+i5ybVNKVRLK7pJML+caVh8Yv0iIipcX0SNjOkwcQAE75BRJg3
	sgfa4MHGzMEPWGYZ60FqgQIwRfU4OaA7g/vs87Gu+w3NOff8xmvkKmA6HbAYWMKRHfUAl8UaisU
	uR9uVcjGmeaq74B9wqGQBqkFRciQ0ss5H1MZtySaa4MTbG7bxCfPY7/Mnxtb6OTFEwn5cGg6kVN
	3XrzHOxshRIiDdJcOE7zxJZMv2EuzcN1uj4Hgy3hdMntS4UDnR6KhQmQIf0sIhZ8LY6Gok7jQnC
	vc04DFOMclLcTlJaUJU+H3VQv6+zvvQQXGJfrBUczQRuUnpV
X-Google-Smtp-Source: AGHT+IFMB8Y9AZBpEj7LvA0t8hOPxK+Op1UcS6RmB+IO5+n0h5R1E/IhvAL9Sl/x1sAJxMqy5rpvfA==
X-Received: by 2002:a17:902:ce81:b0:221:331:1d46 with SMTP id d9443c01a7336-22df34b3881mr25053755ad.2.1745983581782;
        Tue, 29 Apr 2025 20:26:21 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:8ee3:c96c:ad2:9358:5231:4c28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd230sm110832815ad.77.2025.04.29.20.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 20:26:21 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:26:20 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
User-Agent: Thunderbird for Android
In-Reply-To: <a18175cc-3513-4621-9d8d-e9556ede1022@oracle.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-6-derekjohn.clark@gmail.com> <a18175cc-3513-4621-9d8d-e9556ede1022@oracle.com>
Message-ID: <F54435E0-B3F5-4F99-9184-EE4D8D54DBD6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 28, 2025 9:39:55 PM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=2E=
com> wrote:
>
>
>On 28-04-2025 06:48, Derek J=2E Clark wrote:
>> + * Determine if the extreme thermal mode is supported by the hardware=
=2E
>> + * Anything version 5 or lower does not=2E For devices wuth a version =
6 or
>
>typo wuth
>
>> + * greater do a DMI check, as some devices report a version that suppo=
rts
>> + * extreme mode but have an incomplete entry in the BIOS=2E To ensure =
this
>> + * cannot be set, quirk them to prevent assignment=2E
>> + *
>> + * Return: int=2E
>
>The function returns int=2E
>But logically it's returning boolean false, true

I may have overdone it by removing all bools after the v5 review as I inte=
rpreted Ilpo's comment to mean I shouldn't return any bool c types=2E I'll =
wait for them to weigh in before changing this back=2E

>> + */
>> +static int lwmi_gz_extreme_supported(int profile_support_ver)
>> +{
>> +	const struct dmi_system_id *dmi_id;
>> +	struct quirk_entry *quirks;
>> +
>> +	if (profile_support_ver < 6)
>> +		return false;
>> +
>> +	dmi_id =3D dmi_first_match(fwbug_list);
>> +	if (!dmi_id)
>> +		return true;
>> +
>> +	quirks =3D dmi_id->driver_data;
>> +	return quirks->extreme_supported;
>> +}
>
>Thank,
>Alok

Thanks,
- Derek
