Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980A30E85D;
	Sun, 22 Jun 2025 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562833; cv=none; b=gV7/xB6dRq+ddUE6xsfGZalQPOlzr9CLXS2mPPCRNYKwDjH3k96oK5vg3M6JXGADRb7HZ3Zeu+MJSFJ3kESzkc3hf7Q0YYnXKOJkb9H3Tmz6tbJBFpv7a0eUqlSfc4nMKpUNi3Mgqqa4Rfsf0b8I4HoWUUrumD11db6qr9AqHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562833; c=relaxed/simple;
	bh=d+MBMw5Z/vxg4YNzrnsGCoeHPlFH4E+vBvkDBqV/HA0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hV1VssL+BF1T4P1diVDq6CNaN0FQh2PoHUaNg+0ZLKSg4U0EHYFuo5EU/A6L9SJ+9RXR4v6DkHsC46wNPs5R83kf15OKpCyf0rI7joJctGI41J9Ch+TPfqP3pqs3w7fj8WodR7QpxhoFf67UecBDUqRFvaqGnESWOggozCxyK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI4wsebp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI4wsebp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1462866b3a.2;
        Sat, 21 Jun 2025 20:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750562831; x=1751167631; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVoTqJGFMW3PTBPOJh5oHACcOVazKwFwjOY2utZ+yek=;
        b=jI4wsebpDgyXsl8bo87jSIg18LY5mGWUxR/W/Aa/sKmiRLkhuuQicD6PrYrH6a4O4w
         n/Lqccr8fjA7ZenEoTZ9KILT994opoFtV3FMNtuiB2sOWQHyjo/fU1oki+FYImBN/WUT
         +g5mavWOZ1yzGefwosJ47AWMNGlIgVzS3mWoO/iPmQVHvaJryPOfq9/6z2j99ImTUlpW
         tSX9l0guUWjYWHzr+2Zf6NRuxB2HJ7l0vvdrm3nsnFiNm52ty/Z/r5zdrI9HVUcT6zJo
         w2vwaivXLbrORq5O7OguWn33hGK6TEK1ueH5VCitF7Zsld+3AoRCw0/OHIBWgQ6VhYe3
         ryiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562831; x=1751167631;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FVoTqJGFMW3PTBPOJh5oHACcOVazKwFwjOY2utZ+yek=;
        b=kWzaOJ8LgYmiC5OB52wJOFrqT1e3+OhS9zAg+qaaxf+ExZw3NdCReO+suCXvw+4F/h
         VhJql56p8XAjteTPYydtvF+R9AluHRzZosSKCBfY3wETIPnZpf6LyAmCnM0qhiwuFhqw
         A3OXXuDHfaERwvm2Th3JyyzcVtO8CLn7C1Lcr41+wKJdAWbbNLa8FeQrLFgXpPib5me8
         F7imp5kS75z1AjwjBF/HTseSKVhFvdNSTWQ1c1USd4Hni+HYPmQdN7c5s+SDRGXP+fQ7
         DXGk3N9tOyKEvlT/sIZk6m1Q6+oMtkqUpiv85S5facwf/ZYZacFFhhM0Q3vJZCdoPWCa
         WrZw==
X-Forwarded-Encrypted: i=1; AJvYcCVF7dXowk6jESkMhQZpGLNwRCxiwosCt5fc+geYMC204YT/IesFWRJyJwcsgiOEM65oPaAY2TuJAZJbU1g=@vger.kernel.org, AJvYcCWQ91l5CLLaKJHMkM3zrNZLstyNwN9EqexlfdH5RXq7SlX/Y1T2u1NuWMJN5HhRgMRvbhIDIrb+2uIqHe+qvIOsFUhVdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXhqfV32XFZusxbA/lLydO7zQx6icdCm5VSIx3fxzbqGjScz2
	ZlCRG5khKwIwdbn5XIAMfc4ykk19wZqUt7ookhnWlpFLaN/UBFqmUQEo
X-Gm-Gg: ASbGncuTPRHj7Td90jJW5+cZICX8P8Egm1Pi2MxMcWMhpG204BHUOuuIW3XyJVWqyBd
	DNtVNqOppwQQBHba3GaqMJ4XKZleqnO1aByPh1nDoOkE2WovPEmzQnHCzEwE6LjPe+A3ev7i0N+
	WtZO9C0nabRvz0czAckeYeug+PIQIlFycQpsAv06fym2S+lvwM5aHJDw5ZH8PlutJfP/b38XeAq
	Bl6tIqkN5dn7mLipdZ2rMo0r6cfXmnBLZ2pRm4SHVA4TgwsnYYX/wuZ0cE/O5dOwru6Z1rfB80Y
	lW+rXjCpXIQ4QYOS9IX8xOS9CO8jqDHTc2CpXgoCSv8RKcmPlgf0QJ3UyS7WX4bCfg==
X-Google-Smtp-Source: AGHT+IEwAU98wAFv7jXX0cL2bZlQDPPCSB2EprcDiVmj4TR8XmGb7c1BonBRVZgVXsgiN5UpQpapvA==
X-Received: by 2002:a05:6a00:1954:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-7490d760679mr11175992b3a.11.1750562830875;
        Sat, 21 Jun 2025 20:27:10 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6c87f5sm5289344b3a.178.2025.06.21.20.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 20:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 00:27:06 -0300
Message-Id: <DASQQCLO08Q6.WGADUXY300N0@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Joshua Grisham" <josh@joshuagrisham.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, "Prasanth Ksr"
 <prasanth.ksr@dell.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v3 0/6] platform/x86: firmware_attributes_class: Add a
 high level API
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
 <DA17A4BC-938D-45BC-848E-BD8FB43597BB@gmail.com>
In-Reply-To: <DA17A4BC-938D-45BC-848E-BD8FB43597BB@gmail.com>

On Sun Jun 22, 2025 at 12:01 AM -03, Derek J. Clark wrote:
>
>
> On June 21, 2025 5:04:03 PM PDT, Kurt Borja <kuurtb@gmail.com> wrote:
>>Hi all,
>>
>>I apologize for taking so long. I've been a bit busy these last few
>>weeks.
>>
>>After my discussion with Joshua on v2, I realized the API I made was not
>>ergonomic at all and it didn't exactly respond to driver needs. In this
>>version I tried a completely different approach and IMO it's much much
>>better now.
>>
>>First of all I adopted standard sysfs terminology for everything. A
>>"firmware attribute" is just an attribute_group under the attributes/
>>directory so everything related to this concept is just called "group"
>>now. Everything refered as properties in the previous patch are now just
>>plain "attributes".
>>
>>This new API revolves around the `fwat_{bool,enum,int,str}_data`
>>structs. These hold all the metadata a "firmware_attribute" of that
>>given type needs.
>>
>>These structs also hold `read` and `write` callbacks for the
>>current_value attribute, because obviously that value is always dynamic.
>>However the rest of attributes (default_value, display_name, min, max,
>>etc) are constant.
>
> Hi Kurt,
>
> In the lenovo-wmi drivers the min/max for multiple attributes are actuall=
y dynamic based on if power is AC connected or on battery. Looking at patch=
 2 I might be able to do some pointer manipulation with the attribute's "da=
ta" member for those events to make this work, but it would be a lot easier=
 if there was a simple way for me to call my own functions here instead. Pe=
rhaps a function pointer could be used to override the default method here?=
=20

Hi Derek,

All attributes in a given group have the same show method. Maybe we can
let users override this with their own show method, i.e. Add a

	ssize_t (*attr_show)(struct device *dev, const struct fwat_attribute *attr=
, const char *buf)

to struct fwat_group_data. That should be fairly simple to implement.

Did you have another solution in mind?


--=20
 ~ Kurt
