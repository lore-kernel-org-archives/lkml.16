Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A21EED7;
	Sun, 22 Jun 2025 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750563733; cv=none; b=UZksYJqvW9jvuqwq5kOkRTuXa7DDqBRF/f5CvkruL9T1zPceModUkMuKaX0olznv/efRpNfC+NyPt+AC8ciUQ/Zt+/rkZsF756kuNXedbTtPjH3Z8ZyuaK/OcCEyndY6T46h0or4KP5mBkR9zx1p/cVyQRu2zS5qzU3++MORfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750563733; c=relaxed/simple;
	bh=df/RU6vS7r46gg5CHN26K4KwETwBocAQpsujB+Fqij8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GlxBXuQt1yhilWa9r5ZTkpsa/1xYWikzZNISKI2J5abudlmM/5C27KlV5O537WxJoszaNDkgYizbiZFgsgBvnnV07lBzswruDssyOhp9vkk8tI6sJJ3UTM0HcY4NHLjpNCKt2tawtekGwpfk+IM06wFx6v0Y1b9eUN6kmDiSj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6fJs+ha; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6fJs+ha"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748d982e97cso2738043b3a.1;
        Sat, 21 Jun 2025 20:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750563731; x=1751168531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4H7Ru0v2s37Emrsos5i13ygignUvfaRQ2BrMRVg3z4Y=;
        b=F6fJs+haFjFRwdrtCzb1MlWOP64AndryR3sMpJKRnNGirvdwO4LARupuh2VvuJ+202
         mPyutfTQ2aIIhhHg+/DhoWYR3Z/i65niO9266sQnBej3hX1TdJcDGZIGVbC8MGvcXSP1
         /rUmBZbja+yK7IKLufJul+1/XGk/j63Uw9MWsqgRP3QMxphD++7I0hd6XEXDiOTGYTit
         w+Ls4TGNW1HkiKvdSt9BOpTZG9P3tNHy3o0MvXFdq6xKbKUMyo7II7LgCFVlmJpIGPk1
         arUQ7Lz4RBTmgKaoq+mN+4Co8sxpWXyrNxHGJ8sP/D0fkbxAL3XbeLD6wM9jDmzXQkH6
         Bfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750563731; x=1751168531;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4H7Ru0v2s37Emrsos5i13ygignUvfaRQ2BrMRVg3z4Y=;
        b=k2HaSy2as1rOymRLECjoavP2r84QeCPpz/8RxZ/C7sgIQRmj9kUlCBYxpLMs0cCpUW
         z6Vof0l/sdnhgLeBvl0pUVqHaLlHf7AkOK3IBhNqsjHqO9hJGJMS8MBy1nisp4aMXgbW
         bXmV/xJMy2Rp5JN8W+KlvR49wT8muaCWYkSAB5B3lUOySbp1YBXUi9XUT7kfISbB6270
         eDu+SM4mFxP4Ze4OCnwY19MjUfHiugdM2yqaaYXeDlV4rXgPpuMOTknypQYofCSpEOhm
         4QoTSmVhxE9fIBpmIwLaOka4RJ01uE2Ug9PXT38IyeGdt8b0X1fEo/+HRxao4Hja3uXW
         js2w==
X-Forwarded-Encrypted: i=1; AJvYcCVW+6bKUBzklzMNCckOncxU9Ry+yT6t3fC1fyuY9Gw/zWWQiK9lWar5qy0+O2lUim3604sim51yqvLCT/qoDeCETTXjDg==@vger.kernel.org, AJvYcCVbf/ajvZpTnAk+QrPXpqiKHPhjIzyZggqo8Nk9WvbP2aRvgZzQ0iUy3x2mRsMu+U/+p5cCMTHrxcxGd8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/D1onjZ3k9s/3nEHWZc7IC/+1swR6FQ/NvkhlIy500RRDWk6
	gdoOEx5aVzjrHE2Ya5MKIAG5CD9nCBezfzYhRAYdjFYABSXfhzqZ9wZLYaYj7Rvv
X-Gm-Gg: ASbGnctFgW69/ceGGQAZDZ6nuzbgMkUlNCFxeiRwDy0Cws5qsyTwMKKNAMpzQNchmOE
	6L+u9YsF/zduzDsqJlOe4mv2Y5nZ8azu4mwsT4XfpxPGp0h9UUk6d/z/TbYSuH+Gv+3O4eDR2AC
	y8jMZKcFJX5iT1GjXOgMNj7QfMUfxw/ngbnLrTmovNoi2h2e5CIhsdKD+3zxCD+Q4IkAIePVJj9
	0Fp85m8q1SUnPM5/+6v4z8E7+MsbX6PeqULaR1zvvhilocHGumMa5vKo5bTYt68VM8tsHZJUf3j
	CcFSsWyzOBj1ZHi0zNWmjUeady+QjqjIC/0ckd9Vw/AvY98tCVdDoaedbJNZ7kmjmpATd2wfxUn
	eSmtLfOco0f+ZtAK/+38xu6uRF6md35krsHgzBxNFsPuT4g==
X-Google-Smtp-Source: AGHT+IGdcLTzkQtcTmvpAChLvudbT7/DyVZc2q+ShaOKWzMv+CGFskqvnJ+nsaUjtRYZ3TwD3zClBw==
X-Received: by 2002:a05:6a20:9146:b0:21a:b78b:e916 with SMTP id adf61e73a8af0-22026f15bf1mr13176386637.27.1750563731358;
        Sat, 21 Jun 2025 20:42:11 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f124249bsm4124215a12.38.2025.06.21.20.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 20:42:11 -0700 (PDT)
Date: Sat, 21 Jun 2025 20:42:11 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>
CC: Antheas Kapenekakis <lkml@antheas.dev>, Prasanth Ksr <prasanth.ksr@dell.com>,
 Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/6=5D_platform/x86=3A_firmwar?=
 =?US-ASCII?Q?e=5Fattributes=5Fclass=3A_Add_a_high_level_API?=
User-Agent: Thunderbird for Android
In-Reply-To: <DASQQCLO08Q6.WGADUXY300N0@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com> <DA17A4BC-938D-45BC-848E-BD8FB43597BB@gmail.com> <DASQQCLO08Q6.WGADUXY300N0@gmail.com>
Message-ID: <DF4ABD29-158B-4D7E-8096-5C4ADC851A2B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 21, 2025 8:27:06 PM PDT, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>On Sun Jun 22, 2025 at 12:01 AM -03, Derek J=2E Clark wrote:
>>
>>
>> On June 21, 2025 5:04:03 PM PDT, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>>>Hi all,
>>>
>>>I apologize for taking so long=2E I've been a bit busy these last few
>>>weeks=2E
>>>
>>>After my discussion with Joshua on v2, I realized the API I made was no=
t
>>>ergonomic at all and it didn't exactly respond to driver needs=2E In th=
is
>>>version I tried a completely different approach and IMO it's much much
>>>better now=2E
>>>
>>>First of all I adopted standard sysfs terminology for everything=2E A
>>>"firmware attribute" is just an attribute_group under the attributes/
>>>directory so everything related to this concept is just called "group"
>>>now=2E Everything refered as properties in the previous patch are now j=
ust
>>>plain "attributes"=2E
>>>
>>>This new API revolves around the `fwat_{bool,enum,int,str}_data`
>>>structs=2E These hold all the metadata a "firmware_attribute" of that
>>>given type needs=2E
>>>
>>>These structs also hold `read` and `write` callbacks for the
>>>current_value attribute, because obviously that value is always dynamic=
=2E
>>>However the rest of attributes (default_value, display_name, min, max,
>>>etc) are constant=2E
>>
>> Hi Kurt,
>>
>> In the lenovo-wmi drivers the min/max for multiple attributes are actua=
lly dynamic based on if power is AC connected or on battery=2E Looking at p=
atch 2 I might be able to do some pointer manipulation with the attribute's=
 "data" member for those events to make this work, but it would be a lot ea=
sier if there was a simple way for me to call my own functions here instead=
=2E Perhaps a function pointer could be used to override the default method=
 here?=20
>
>Hi Derek,
>
>All attributes in a given group have the same show method=2E Maybe we can
>let users override this with their own show method, i=2Ee=2E Add a
>
>	ssize_t (*attr_show)(struct device *dev, const struct fwat_attribute *at=
tr, const char *buf)
>
>to struct fwat_group_data=2E That should be fairly simple to implement=2E
>
>Did you have another solution in mind?
>
>

That should work, yeah=2E=20
- Derek
