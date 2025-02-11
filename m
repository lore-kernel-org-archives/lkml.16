Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48825261563;
	Tue, 11 Feb 2025 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295100; cv=none; b=mxzKJwMqL9t+4hfM00/6OAVlV2hDxjIgK0U71+9DfjxNz6VNVJ7LzmfZweQ2Md5zLRHRTV3FDzMpyfdltlIpPNhXwxOtX+7dQqFt9mJTyypVT7mhwvDJYgxOm/jW9JLByX2l6m/UDnAgn3W9FYDKfx2zYZOtZsr2QXn4UxQeuL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295100; c=relaxed/simple;
	bh=RNicKc7mCVst/dWcEvNqihoEoVkeIlWZ2yuMeNIASNM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EErdbsz/XcCFdLw1ZkGYRRS+EwJQ/3soXvM/g3v+cuNV5HB491eEDzWCQEwl+Im0+Tin76g/v4ruJKVzD2sDcNyvjoI/55tlta6DowtMVGbo59wFV0meJ0wQX6QWA8gZ4OkAWJwNcZkq6ALQHlKb+ipd7JsEQa+0/9dP8nUSeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmxAZwUF; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmxAZwUF"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e587cca1e47so5315879276.0;
        Tue, 11 Feb 2025 09:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739295098; x=1739899898; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13lDDGr8ZQiww5P+iBAzNtKRpypMG26CE3DxSq0NSsU=;
        b=LmxAZwUFrCWR+E5r7H6yxEj2LDY6cYE/p6vdQatPD3sA3tWh9/jczTk9eEM4ghBQ4q
         rK1nVg1nph1WpmNjvschbN+07enCBUOLsbQC4kUovTSYFYP8KOug0pkAW7UCtoQoGNjh
         T/ZKvrtFO0q2DGQ+xyL3LTs0s1i2NZEKugy0liLdkQsge1d8XsSqmVp9HGO6vHVytzjD
         jBjkxenpL1NykPFfWpk6YFZuG1RhGooC2p3S7oCKcTOstozuyOvvBv6P7Oq2VTfbeJGq
         JZUgzscAub4l5LwGPxVC8TrM2WygJ3KAufASo7Fmd8RUeJ3NukrmDDXDwddYgkj+u2x5
         6NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295098; x=1739899898;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=13lDDGr8ZQiww5P+iBAzNtKRpypMG26CE3DxSq0NSsU=;
        b=NnJJWLfk9f2oHa+O4Fx6e/k8OZghcZX8tSQT08sJ+05rRReLnS17DlI3aL42D5VAFY
         E7D4GDDX4ICKvZlM2zWbd6zszVtuaoIOpA6cFKP5sffKf/R0EJOpI3ZFBine4RNc69N+
         +jLDWWvvqAZ+/yyECaDrjgBej8R3sl5fzZZRX3nVxp627JS666Du+U5SRu3TA8bR3JvD
         Hw3skzUCBIzjVTU8HU+EFfjnwX1XfuCeTdWnZOveTFiiebxl21VqtlYCHuHnt5W/nmys
         BEPKMBoLLwWhSUJwmwnvc0g6gce5c9MZM2Z6rbWC/3aVIfMLvRbClUm1zQmINXwyJ85X
         Ji/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPwK2bY0YSewt6km9ScevkjKOdmF9GkXe8eth5W3vMnXLgULStXlkwdoQL5vQcBtmuG5nLZQTVIrS3QK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOSPENM6kHfgCvp50dx7AIsYQq9d4pLugJkIYOWPNJsZekGg3
	UJp7WD8xnd0YtbHrh2FvjkZ/vC8ZoDQEAJfHrzLUrb9p5WSw2eGl
X-Gm-Gg: ASbGncvy2py5rJ9V0TxHex05we03KvgQqV56U72a8kwyhYddEyx3ISQpmZ0mcMEOXF/
	1YP0nHVAgLnnFlv6zKPIfDxzpqalQWrO45ymlIkbxQhyl2Ee6MIi1MRr6wdQLv5bpPOsEINO+BY
	P7eobsh5Fl5mloxzdxtAFJYfEjU+GCB1LlBJAOC6wszCgvAQas1ql8R7l3cWwvkuUyqHZVa3kBD
	jQpbPyXhkX9wzY91bNc/lUPi3gWEELdTaa62oDNHMR3MJPcwLBBvgVx/vyxiJxDbQoQqWUj7V7T
	Z5yT5/f+
X-Google-Smtp-Source: AGHT+IH6vXqS4xor6iNT/+QQDlIpy5sRDeTuhdk0bj0bh8IIQcu1/i0kXALqRXwbOEnkTvi3Mwi6iQ==
X-Received: by 2002:a05:6902:11c7:b0:e57:442a:befd with SMTP id 3f1490d57ef6-e5d9f16d588mr236577276.32.1739295096704;
        Tue, 11 Feb 2025 09:31:36 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a48b167sm3409304276.53.2025.02.11.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:31:34 -0500
Message-Id: <D7PSNJVIIQ6Q.99BIJKP7H2YU@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 09/14] platform/x86: Rename alienware-wmi.c
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-10-kuurtb@gmail.com>
 <Z6t9naLPpVl_L9hw@black.fi.intel.com>
In-Reply-To: <Z6t9naLPpVl_L9hw@black.fi.intel.com>

Hi Andy,

Thank you for your review!

On Tue Feb 11, 2025 at 11:41 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:05AM -0500, Kurt Borja wrote:
>> Rename alienware-wmi to support upcoming split.
>
> (the change that is caught by my eye and induced this review session)
>
> ...
>
>>  obj-$(CONFIG_ALIENWARE_WMI)		+=3D alienware-wmi.o
>> +alienware-wmi-objs			:=3D alienware-wmi-base.o
>
> objs is incorrect! Please use correct y instead.

I want to understand what is exactly wrong here. This `objs` pattern is
used a lot in this file, so I just copied it. For example [1].

Is it wrong to do it here for a single file? Is it wrong to do it at
all?

My goal is to split the file, but link it all together in a single
module.

[1] https://elixir.bootlin.com/linux/v6.14-rc2/source/drivers/platform/x86/=
dell/Makefile#L14

--=20
 ~ Kurt

>
>>  obj-$(CONFIG_DCDBAS)			+=3D dcdbas.o
>>  obj-$(CONFIG_DELL_LAPTOP)		+=3D dell-laptop.o
>>  obj-$(CONFIG_DELL_RBTN)			+=3D dell-rbtn.o

