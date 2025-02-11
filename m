Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD91E2838;
	Tue, 11 Feb 2025 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296323; cv=none; b=NVx1CIhQQsvY9HJNn6TPVY25Y6/3i2Ni4vP7pvvmiYmKUj2rgu2yBhHu6CiYIYyFnEaKj12QGlhlN2+FbaIxr4gbMnfmp6mkevmEacDH/Dp+YGberKqBx3Jg0JErSwp54CzpkwN06INskUVmbDrdB+X2cE6lPgApLvYO2CxXMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296323; c=relaxed/simple;
	bh=LIkAy4ET0bdltWGfkdDtlEuheEJbDlRUHW/Bb2K4/wI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ux8lLyuHd9XtTut6MDzYbEf6VldFOazE+a3ASdj6MhuTn7+tcd3dSuMUdrzVlrJRXG3fsNF/gAVKEoHtEI7tCJu6SteQfcyL6Xcaf1iSMTSX2iDli85vQQmkC3FXy01SZZZHvOPRBuCCFQNdBuSLrpg55Fy4dQRPJetEmAUCbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRkNlHxE; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRkNlHxE"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f8c58229f1so54327b3.0;
        Tue, 11 Feb 2025 09:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296321; x=1739901121; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qwXQA675KH9nLYOUbW2kE+0rvscD1TwrOIlUfISHVo=;
        b=MRkNlHxEWsjn4uFhhxNEiwBffZfqy/eAeugxt1fA/jU3WPIssmM5QrzTa3vqfi8BfZ
         PU8lQ/rcLxPzD89n1zRbYxzoKPHL5xYWMkfS+Gt8E6UpV9Uz7bwlUe2GmcXqyFN78J+p
         aeCjxEmKSnLvmW/vCl35+LEt6VfhAo/fUQIkKuHFitbMian6rb3KIFu3X3m2cxqbRPPo
         S4a+O+yriNZIfAVprcRDI8XgtwW54nQIEiIf0LFmIQysFuad69z2CJsefFb8+1zJwHNe
         c53R3MRMYEWLjerCOvYqwo55hpgMaYgD9uHahl4GIwJSHiK8SyiIsqthLsUx/5UEPD3k
         bz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296321; x=1739901121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5qwXQA675KH9nLYOUbW2kE+0rvscD1TwrOIlUfISHVo=;
        b=qKsKupd4GqZbvw8z7ilvGe+Y9ePZwH0M3uu4OYPme5i8itctAPAjNywmlPZrXi8O1V
         wiyKXwy3UYFTyKkIy2VMtPqPovHY5vm8lGQ8/0q9dqmGbE92jr9i0pqBiFq2kRlj75+J
         A7RVvWiasGE8yryPse5Aa80cn2APC9H83gjh8wSBXLoya+W5SaVtc0WpJzSW+QA/l1U4
         YvfX9zgF8vNcbxFXt6RL0So9i2oEYqsu/NwZVbgyJogFTH078tK8pRu2/gf/1NHkwAZj
         04OXuQNTm5B9rGMF06y3KGwl6EjPNR7sxdY6oQwc1eTUsVqMwpJpg/Qn+00Mj922L5sF
         ct1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvHJeB1VhSYMPpNcN4wcH7ncNC73sOFjSzJz7xZjAACM8Az/95KjkzxVjgMY7Gs/LuW3yn5HqIctn50xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxWBceQk460T/VWiDEo1GeQLMD21TDL31f4uQh3tS7Uqhe0vQ
	2YmsAQPouaBoVnu3pcbZ1rMwzvPmRRa+Axk+cZO/yrT+lwCXCBtI
X-Gm-Gg: ASbGncurAAcOOWb2+AniyauOe2itLADQPVPInvYzxJzmuyAPlix+Vs/MhMZl4/8+A88
	U5aGtSourVYoK4alLzx7TEcp4dXJ0jX3EnZNRTHnAXQEDrDdYrGoggS5HnAzis7Ew9nCaLWp4Mi
	fQvID4goizYQpXWpsYTq4HVuOnpQULmOUsKuRhQP16urqH4uOyIf1ay2cqrQWal6fhDYrjiaELK
	Lfek77ZOkxTUI5ktJ5UOJQHnkbqPw6WaZBX6QWgGYU1OPw5QK9h7UHID0+cdi1zlLy+eooFe+D1
	bA0ejyxC
X-Google-Smtp-Source: AGHT+IEGB4LloUYbMjYTmnK3fbUs2QwDyFmUwfUIA/kw8Ul8N8ZJt9fz+hiyupyhTwnSgFgGRPgcQQ==
X-Received: by 2002:a05:690c:6887:b0:6f7:9f95:d916 with SMTP id 00721157ae682-6fb0c53aca2mr55400847b3.16.1739296321007;
        Tue, 11 Feb 2025 09:52:01 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc0aeasm22128447b3.96.2025.02.11.09.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:52:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:51:59 -0500
Message-Id: <D7PT36DCB1P5.2YE8H1MHFAE15@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 05/14] platform/x86: alienware-wmi: Refactor hdmi,
 amplifier, deepslp methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-6-kuurtb@gmail.com>
 <Z6t8y7VvZL6UDEck@black.fi.intel.com>
In-Reply-To: <Z6t8y7VvZL6UDEck@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:37 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:01AM -0500, Kurt Borja wrote:
>> Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
>> use alienware_wmi_command() instead of alienware_wmax_command() which
>> uses deprecated WMI methods.
>
> ...
>
>> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
>
> Rather introduce pr_fmt() and drop all these prefixes.

This was not introduced by me so it probably requires a different patch.

>
>> +	if (!ret) {
>
> Traditional patter is to check for errors:

I wanted to change as little as possible the original function, as in my
opinion this would require a different patch.

>
> 	if (ret) {
> 		...do error handling...
> 	}
>
>>  		if (out_data =3D=3D 1)
>>  			return sysfs_emit(buf, "[input] gpu unknown\n");
>
>>  		else if (out_data =3D=3D 2)
>
> Redundant 'else'.
>
>>  			return sysfs_emit(buf, "input [gpu] unknown\n");
>>  	}
>> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
>> +
>> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
>>  	return sysfs_emit(buf, "input gpu [unknown]\n");
>
>
> ...
>
>>  	if (strcmp(buf, "gpu\n") =3D=3D 0)
>
> Wow! This should be fixed to use sysfs_streq()
>
> ...
>
>> +		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
>
> pr_fmt()
>
> ...
>
>> +	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
>
> Ditto.
>
> Also note, if you have a struct device available, use the respective dev_=
*()
> macros instead.

Same as above, this was not my line to begin with so I left it as is.

>
> ...
>
>>  	if (strcmp(buf, "disabled\n") =3D=3D 0)
>
> sysfs_streq() / sysfs_match_string() =E2=80=94 whatever suits better.

I can send fixes for these tho. IMO this requiere different patches.

--=20
 ~ Kurt
