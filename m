Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17B2F2E;
	Sun, 22 Jun 2025 04:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750566461; cv=none; b=ie/wYgrmT/0z1O4jK2JT7fsZay5oE0Dug95czzCcLHdtLD1Xa2h9I7UQfiG/5KsZPMFDFXjnStwHgNcYN666SGkcQLWEIPsJaLB87ILRzZP78hZNPLXeC+92znLtSesJfFZr9KN+q1QDEEvIfSFFx+K39P7YvLg+A0njged2sgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750566461; c=relaxed/simple;
	bh=iCOF/K5X4bAOaoV+D/K1MxYNzdPkFPkOlnRW7O/LPPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y+fx+eMhTUZ/oEbmhD8rw/+dcg5HV1Im0OdLjNXpdeGK51YGH1X74loYjr2nF44FaNgIONlOZr/E7+le30bGKl4vSGZE9yrO4PjFreLO5PsFPLb//Eu8hk6y3NM2jTXoZtOMB62OcgRYJUbrU0hAsMpRoS71+2um8oXHXpdRYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxgGJZKb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxgGJZKb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so24154165ad.3;
        Sat, 21 Jun 2025 21:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750566459; x=1751171259; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2Aw5qYPQcheKlwYiFKa9iPN3MI1HFL9oXfK7SQu+ps=;
        b=SxgGJZKb2h83e8bJQnYMz05qmQeZVk3ucK4MJgg9mmVPPrbIT2eHGJKhrp0dZyqgAs
         e8TqextAnjPG7/gT5YPkGWWWoxodBtB1t6MCl+TtIEyDVTfT+KJ31sCSA1AD8vbqhe04
         6z9lUNPrOHNDrsaT1pLJd6Q8ApTZlTK4vzkO5qLp0Eqd+9PmnwSX31dBOwIWhgLmvbZD
         8zcCs1jsjucc/vOth/SVo0xhXI2yG2GNFmj3wZYjb5Lsy/0ezZDm1lQSIqxhglqVLP8w
         GUH5fXDo+t7+R+ul+RJ4uPHO3FaFiwjnf0NNK3rErrB1L+0mMx2Ci5TgRrjBmXETcvbB
         qG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750566459; x=1751171259;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2Aw5qYPQcheKlwYiFKa9iPN3MI1HFL9oXfK7SQu+ps=;
        b=LkhlZl7eFGNFwlVLz8qzHj2dPhgDN5o4MY4RyWq3Vm+kmhJOwszUEGrD6m6xu1tIjN
         IkHuGC8bIe0HYFnJII/oNLxx5CCj0Wrua7/fxUBieqaelHTSfLfdATA2nSY/y+48j3VY
         ErgRUZil8Uy58ZKakTL9wRHEbnJMWYOon98XZ/6nCPxrPRgulFB9lvCliI5ryMuxTh7n
         lAotCviAFman3bFiXmNpI5E1lA4tP0TZk2yhj9H+d8wZT+pZ2KsTHNlIOh4Rcv2AbTnN
         aA+uXXds0CJ4cE88NrxkrZPUkQ4e/HvlJibwpyrcM6SYngY2ljX9rUbNx09TgDrL2qKS
         pSjA==
X-Forwarded-Encrypted: i=1; AJvYcCXCcf7sd598/bigKkxF8wkHOBomjpAj7pSJ7L6wjV1e718XDXJlsEoW9b0E2a8CXZM0UKimnrkoTfY/Y2o=@vger.kernel.org, AJvYcCXLQL+w7JuCQiYzZ+sbqv7cIOC7+ytGGY3bgwxsB4HjlUAeJKaKuAs+DNadeh+tckhD9jH7ff7FHgMEg4fTSIkEvh8uiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycRDHry5pRdHWEB3UxY1akjVMN4QSomI2EnwWUaGWVdJL3+dCJ
	UBgV85q1QdcBa1tVCc8KewpGOSNx+tBVpVEyWCT+cNf8P+Epo89PmFw3
X-Gm-Gg: ASbGncsX97+7lFuG3eajHSxNB4W2BOaSHyybtQu8SYTDXaYI9FD6JVeBQlaxgBf4oZf
	VGrNUulOALLKiMHPgo87xss7dxID6QuK4jUE9FcJRWTzbfaTvcVdkHkDVU8Q2Y/lu1cUqsDVigk
	gy9gAZam7LCofo8Xi/Z9Zb2Yon5711HaLvi3qQ6jy0vPdOQXy4vqU7pCFesNQKuqinWU5rUnz/t
	qSrOGVf9eV4aAgezWxRdBUXKBNqE4RJ2aTvOrgLS6TOiM3cNOce0mr5RBwyEvfp6V7nAdNUYZvE
	Dyfu/M5wxbQIbQrwaHE137x1nWVB54Sw8Xkp7Cm7XbYCt55rKiVj5F2S8KUSP7phxg==
X-Google-Smtp-Source: AGHT+IHeBuy+w7TEPP33XduJcFzzz8JbIH7zTmMMlcTdYcc5YrNiQhg5ujBu9FDlmNHgrJMcOmPFBw==
X-Received: by 2002:a17:903:2285:b0:235:eb71:a386 with SMTP id d9443c01a7336-237d9b8e9d5mr117029895ad.50.1750566459079;
        Sat, 21 Jun 2025 21:27:39 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d5c97sm53186375ad.70.2025.06.21.21.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 21:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 01:27:33 -0300
Message-Id: <DASS0MF0SCE9.1AU3QG8U6A6WV@gmail.com>
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, "Prasanth Ksr"
 <prasanth.ksr@dell.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v3 0/6] platform/x86: firmware_attributes_class: Add a
 high level API
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Joshua Grisham" <josh@joshuagrisham.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
 <DA17A4BC-938D-45BC-848E-BD8FB43597BB@gmail.com>
 <DASQQCLO08Q6.WGADUXY300N0@gmail.com>
 <DF4ABD29-158B-4D7E-8096-5C4ADC851A2B@gmail.com>
In-Reply-To: <DF4ABD29-158B-4D7E-8096-5C4ADC851A2B@gmail.com>

On Sun Jun 22, 2025 at 12:42 AM -03, Derek J. Clark wrote:
>
>
> On June 21, 2025 8:27:06 PM PDT, Kurt Borja <kuurtb@gmail.com> wrote:
>>On Sun Jun 22, 2025 at 12:01 AM -03, Derek J. Clark wrote:
>>>
>>>
>>> On June 21, 2025 5:04:03 PM PDT, Kurt Borja <kuurtb@gmail.com> wrote:
>>>>Hi all,
>>>>
>>>>I apologize for taking so long. I've been a bit busy these last few
>>>>weeks.
>>>>
>>>>After my discussion with Joshua on v2, I realized the API I made was no=
t
>>>>ergonomic at all and it didn't exactly respond to driver needs. In this
>>>>version I tried a completely different approach and IMO it's much much
>>>>better now.
>>>>
>>>>First of all I adopted standard sysfs terminology for everything. A
>>>>"firmware attribute" is just an attribute_group under the attributes/
>>>>directory so everything related to this concept is just called "group"
>>>>now. Everything refered as properties in the previous patch are now jus=
t
>>>>plain "attributes".
>>>>
>>>>This new API revolves around the `fwat_{bool,enum,int,str}_data`
>>>>structs. These hold all the metadata a "firmware_attribute" of that
>>>>given type needs.
>>>>
>>>>These structs also hold `read` and `write` callbacks for the
>>>>current_value attribute, because obviously that value is always dynamic=
.
>>>>However the rest of attributes (default_value, display_name, min, max,
>>>>etc) are constant.
>>>
>>> Hi Kurt,
>>>
>>> In the lenovo-wmi drivers the min/max for multiple attributes are actua=
lly dynamic based on if power is AC connected or on battery. Looking at pat=
ch 2 I might be able to do some pointer manipulation with the attribute's "=
data" member for those events to make this work, but it would be a lot easi=
er if there was a simple way for me to call my own functions here instead. =
Perhaps a function pointer could be used to override the default method her=
e?=20
>>
>>Hi Derek,
>>
>>All attributes in a given group have the same show method. Maybe we can
>>let users override this with their own show method, i.e. Add a
>>
>>	ssize_t (*attr_show)(struct device *dev, const struct fwat_attribute *at=
tr, const char *buf)
>>
>>to struct fwat_group_data. That should be fairly simple to implement.
>>
>>Did you have another solution in mind?
>>
>>
>
> That should work, yeah.=20
> - Derek

Just realized that's exactly what you said :)

It was indeed easy to implement. It will be there for next version.


--=20
 ~ Kurt

