Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C94198E77;
	Sat,  3 May 2025 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746295513; cv=none; b=DBd8dUxcuXB683dWl7u31klJrT1mEfhrRtaJHI/KZFmDT90enGv9mnmvaNLR60ufAGgRNADPMkuWuskSorm0QOGBrdlKpSqLUrF0EmVzEhVOwXIhfZnDJxXad7MqcS9XGui5RtkjtTnnv91JaGrD83JTdfStEeSVlEZNEVmHgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746295513; c=relaxed/simple;
	bh=55Fe24q7vIaHhB804cpFvu9KXYV1dEvQwZDCf4u0muM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KaYR9SM3m+VqfhbXWDyjTwotwl0R2MDCLqYx7LflTbFhTx5XAiDuTBk+PbeozV9ZaCm5244R6gXyNDbneOv7mH2VTvZ41r+is09DHtLI7AxCX0/SW9HxYq62efLpUai31Rt0i6f4+tFWNTh5jddA1Pggn2x2PrFax6aT2QZYYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8RKQ4dG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8RKQ4dG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2260c91576aso28958845ad.3;
        Sat, 03 May 2025 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746295511; x=1746900311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n/PkEjRtPqGBzsdgorm91zAu8hl4Zpj64cOLy+qt4uk=;
        b=Y8RKQ4dG+V8tm9PgTdDhuPI+GRgaI2nppbmrLNB9GZfzCTfttCu6I83+tPuqzp+zYt
         WN3i0q0Jfwoo6XmybZPtMFQNvtiVtvucpZAcMn9+Gl8zmGmF6K28QGK2eRgp7o3BWGfA
         lXcnBJJ5Gq+l+tbaqLacONS4jHz6mJR5wAQCM4+1s/dQOHY4ioyG3bYJlZ1thQEtjfIG
         KzaxPr2kbxZivV+sUi3JlIU+cfXfccdggU3g7qI6CTl9Hfxfc5UwuBUjEOZoUEkgYTda
         y5PC7CiTDqDNTR9NGZtTZ9dM35zlM1JxSMPHyFjG7p2E6evv+p3Dz+y+hkbemVGqWFWN
         /Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746295511; x=1746900311;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/PkEjRtPqGBzsdgorm91zAu8hl4Zpj64cOLy+qt4uk=;
        b=QjBPO7lc6CAEg7qPD5JX3ui+VWi1Gj83gFtzYJt7mfWLKakE9QBFA95DSfJXm1Wn77
         e/8+KmWQ0t7zkxCC872lVbyFJGeJ5iWTKIVK9CmWbV+R8ouwv9c4CLq2McgZMvxyz0Iy
         vaAvXxknxBDwvCUmxMOOnbhqDZ1bPUEseBvx5wbKohwImbdC94kDaOviwIfyV05OpAqY
         W3bJmEuVn/AfjDhEGQLDX+Xof+kmcl3qLiWL/SxQb8JLQI33WW9DK+MNZXvNdk8v/1O9
         cEbRiBzaqD60R2B8Fow7Dl8ExyMKqCoigU0E36TvQ56A/Uz/xnDWXqnFmE7nCn4IxV1z
         0GKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBiIBR2SeLZlg0LG7OK939WweGAzISCFWJ3yHvgxZy7bev8+0poxyspApoK0euldWgnXBb4NSWCDC5/sWpGwO3D9I3Ww==@vger.kernel.org, AJvYcCUuD6LWG+NeRIdJ+a1im0WwPLxCicsW3nQfjW4r1SwYLU6LOUIgf0pRRR/qfL1k31FAD4kUuQEDhO0=@vger.kernel.org, AJvYcCXL6NdIpeNhUg8Z7x3RIKndF5vWpU/E3HEMGXvBrYmD4EZ29BDvV/H3zeMg3K4OQX5NwgkFVls5Sr58oNVS@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrMm8Q1AJN/LQXzW1LgJd8qvgK2U/3SScKMFlZWrgpv+K38Yq
	dtmfwHTqqnLEkpIpyffn20NTnUM+Q7rNMIewBOFwS7qGS5oRFlM4
X-Gm-Gg: ASbGncty3X4udeHJtrWAtlSbAKHwqApNKK9OB7BD00hxoDWLrP7R0Ez37/BHqaGrwIc
	rUmkfXiDYjc8vnyixsGqTniVUJbL3oXkkW+eUDCCwMVQBiBfYc7718ehJ32xOwj+hPlHr1yq721
	3fg1SJGGBsSyd1c5/b1sp+1GHvtJafZL/j4AmNKztORioIEkGi7Dz18XNTUVFmbO4Dt3+aV7IDk
	sKvkaWeYTQ6la/Sp9eg/Gg0Gh5Ca5nZldR3tpgFlwL0uWCpgUn0H+IOWs4r2fKEIXRZcaShdi6V
	8d6UJDfKZt5CYY8zIPnyqSbXN1GVoBWDACFa87PiyzZRowbuYNJx12H+SJpuL8dE9IVqz8F/Z6T
	7nzLCl9GbFGyl5cVFld+REtpe
X-Google-Smtp-Source: AGHT+IEbIxip9Ci3Kt8zSoH7Tpz0Zha7CXjsiwTgyoOeVMqijIS8bddEhMHIwd0XcWTXROvBhbrzTQ==
X-Received: by 2002:a17:902:d50a:b0:223:6657:5008 with SMTP id d9443c01a7336-22e1ea83ad7mr30760955ad.24.1746295510896;
        Sat, 03 May 2025 11:05:10 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fc85sm26648015ad.110.2025.05.03.11.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 11:05:10 -0700 (PDT)
Date: Sat, 03 May 2025 11:05:07 -0700
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
Subject: Re: [PATCH v7 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
User-Agent: Thunderbird for Android
In-Reply-To: <d99f91d0-e511-4012-b681-c348ab5c2fc1@oracle.com>
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com> <20250503000142.1190354-7-derekjohn.clark@gmail.com> <d99f91d0-e511-4012-b681-c348ab5c2fc1@oracle.com>
Message-ID: <1BC3B1AB-98D8-42CC-9CD7-2770BE19228C@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 3, 2025 2:42:38 AM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=2Ecom=
> wrote:
>Hi Derek,
>
>Thanks for your patch=2E
>
>On 03-05-2025 05:31, Derek J=2E Clark wrote:
>> +	attribute_id =3D
>> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_CUSTOM) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +
>> +	//capdata =3D devm_kzalloc(&priv->wdev->dev, sizeof(*capdata), GFP_KE=
RNEL);
>> +	//if (!capdata)
>> +	//	return -ENOMEM;
>
>remove this dead code
>

Woops=2E=2E=2E thanks=2E

Are you planning on reviewing the other 4 patches?  If not I'll fix these =
up and send an update today=2E

Cheers,=20
Derek

>> +
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return ret;
>
>
>Reviewed-by: Alok Tiwari <alok=2Ea=2Etiwari@oracle=2Ecom>
>
>Thanks,
>Alok

- Derek
