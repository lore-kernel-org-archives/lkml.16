Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FBF3FE5;
	Sun, 22 Jun 2025 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750561296; cv=none; b=OzcvCLnBiMAtcXsxYfUGNHWKYkrKvu9hSjpazfZplgUExoU/vZhD2LFDwNaW1Fz/P64nIHqleDrxsu2PyalqNdjrUpaawSDjO6QSc4zoRXHHQmK0+wo6DW0AmzvPaGLwQRLoB6MVFDOwWPREUIoplVU75WjCzI90K2YDu+HYrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750561296; c=relaxed/simple;
	bh=/LOJW+y3by8ifZ9R75mBE18L9mKFy0HH1bTgtEvxX1o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=T63mUX7Mu+yRI4uljUs827nWo5JWTyNl57Hphsz8G2qqkAOGKEvCqhHseGvDaaHrAPgwv1qyQh9HVfQKNJFLNC7VWr6aJohHd6B78OGcWu9jd+yHcWA22EutMcO5OnSgUjmMXrAbvBcOT6Bs3zECm05SdB/r5ZnB3sgYVHt5Gv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSeXsTX0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSeXsTX0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2283774a12.3;
        Sat, 21 Jun 2025 20:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750561294; x=1751166094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g4SPoVDkvyDDZXb9CozPQBHXoiOdUpCp+REvtOJc3XU=;
        b=QSeXsTX0XxfdUcP7R7feNg6tvmshPFMOdRbiuyP5AxrEMIksBk5F7X7wbN/CxQ8XqW
         hv6bHmo1KgGuMdPcwUUmHAOMSOWPdHrW8Ue7kgx76fxO+GImyQUXTbxRR3psmMrTL9FP
         qLTjVNuY76N7V8iuJJlqK+44wo7CcJAWPxI0783ATUnuwcPZdiaXIu/VfaOLffURShVH
         263Gbqt8cWTpObperhCJH5/uD9OKjCD01gMuM1PhhS+S/npEbHTqHhamptQhmmzFGZQm
         NlbokPZ2XLCtnhcwIWnai3KGlglThojufisNAd0bJj/oeZxvZjG4MdmixMaQkbBQMKET
         M62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750561294; x=1751166094;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4SPoVDkvyDDZXb9CozPQBHXoiOdUpCp+REvtOJc3XU=;
        b=uj9odaCIfjxXBlVpauoiNlyWxFCy+quq6YHMyGrct3e9WzwrIZvd1H7W1mEnGBCyOD
         nYZwkyayCR62ifM+BAdBm38Hf/v2f+UMGFq7Ks45XWGD/4/CRjkuvPgNnNsFbJG4FNHh
         HDJV9bRlAumo5PElSLUMCKYHwtNfGDQEVTYOq0saSckarFbAcPIav7Mz2ocnBxhYe3zu
         ciyyIkI44P3Xn1MUYA9XRa0xJa4hSDShSAE7JT/X8nE8uLUv4ipYMkO8THgnWaH8NjjG
         m2BxQ+2ikL63K5HAlwQBl3rCTZeQ29kaq9KuCgFB7+aSyRvWrwFnsKar4PTRNMURcZgR
         Q8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCU6Zr2O5HRxNu8/uTWC9I5f42YJ3NzWrRf/NS6m4EHpjgIvu53vBTSbCJW6OOD92TUZA8lYsC/I52saKafIhE7Y4eBnEw==@vger.kernel.org, AJvYcCV8QBqzNFsMLvcBOb8DytZbYLaa/YJsP0kP4j/bvt83XIj6UOwWOypJbbLyMQm7WyOG96+OPmerKvHlqtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSb7spQzBiqjIrntKcOLWe4lsmB2LPyOTAXbd7y2aqcU8X5Cs
	lEGOKf+XuR9D0FJ4q5sGa9H2NDsEQ5g0MzhOnl4rPmJ5SQvWlfganCQE
X-Gm-Gg: ASbGncua/QUD2yP3kTmy79YcJONOJMOhZU5U9TAAL4mshk5MwHsVwZ8HkJyHiCZEPr+
	De6sKTYY+DWpacv9kbtXRZRkp3/JTqy96ENhBXOrF1L3FErFuR+DAJoF4bTVMymRb1nSTGgMlSB
	g67sVFm4tZQSgYK54OlJ0ZwV3Xs+YdExgoxqKwRAH4ZH2NOReQmcZmuQzdIiDfO5bHTZsup1T8F
	QjG7gqgg0Qw3aPgJ+ZSgxH1NP4JCcsQfTdINPpQ0AVJAmvjtLENaVlAIsaH99AnWYD+MkAAWPvL
	lC2AHcc2U6FRw3Lf+DBaKiMIicRNt8AiBlBanBbj8HY8pBIikGl8Kio+E8+Vq0USZr6+o7ko7tJ
	Ek0Cmqvt4SMAAF1PPlFUT7cLzeFZenGDo4LXf8YaGOrNqSg==
X-Google-Smtp-Source: AGHT+IEZ2kPjIT42YUtylGd3G8KnY+90c1WLC5p77KvrkYvDOokebRUAH3cP/Aj1DY3RuQpgibGOqQ==
X-Received: by 2002:a17:90b:57e7:b0:311:ffe8:20e9 with SMTP id 98e67ed59e1d1-3159d8c5337mr14393938a91.17.1750561293791;
        Sat, 21 Jun 2025 20:01:33 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71d33sm4892560a91.8.2025.06.21.20.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 20:01:33 -0700 (PDT)
Date: Sat, 21 Jun 2025 20:01:33 -0700
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
In-Reply-To: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
Message-ID: <DA17A4BC-938D-45BC-848E-BD8FB43597BB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 21, 2025 5:04:03 PM PDT, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>Hi all,
>
>I apologize for taking so long=2E I've been a bit busy these last few
>weeks=2E
>
>After my discussion with Joshua on v2, I realized the API I made was not
>ergonomic at all and it didn't exactly respond to driver needs=2E In this
>version I tried a completely different approach and IMO it's much much
>better now=2E
>
>First of all I adopted standard sysfs terminology for everything=2E A
>"firmware attribute" is just an attribute_group under the attributes/
>directory so everything related to this concept is just called "group"
>now=2E Everything refered as properties in the previous patch are now jus=
t
>plain "attributes"=2E
>
>This new API revolves around the `fwat_{bool,enum,int,str}_data`
>structs=2E These hold all the metadata a "firmware_attribute" of that
>given type needs=2E
>
>These structs also hold `read` and `write` callbacks for the
>current_value attribute, because obviously that value is always dynamic=
=2E
>However the rest of attributes (default_value, display_name, min, max,
>etc) are constant=2E

Hi Kurt,

In the lenovo-wmi drivers the min/max for multiple attributes are actually=
 dynamic based on if power is AC connected or on battery=2E Looking at patc=
h 2 I might be able to do some pointer manipulation with the attribute's "d=
ata" member for those events to make this work, but it would be a lot easie=
r if there was a simple way for me to call my own functions here instead=2E=
 Perhaps a function pointer could be used to override the default method he=
re?=20

Cheers,=20
Derek

>In the simple case this metadata structs can be defined statically with
>DEFINE_FWAT_{BOOL,ENUM,INT,STR}_GROUP() macros=2E However most users of
>this class obtain this values dynamically so you can also define this
>structs dynamically=2E
>
>In the end all groups (static and dynamic) will be created using
>fwat_create_group() after registering the class device=2E
>
>Let me know what you think, your feedback is very appreciated :)
>
>I do have one question for anyone interested=2E Should constraints over
>the current_value (such as min, max, increment, etc=2E) be enforced at th=
e
>show/store level? i=2Ee=2E before values reach read/write callbacks=2E
>
>Signed-off-by: Kurt Borja <kuurtb@gmail=2Ecom>
>---
>Changes in v3:
>
>[Patch 1]
>- Fixed UAF in fwat_device_unregister()=2E Device was unregistered after
>  freeing fadev=2E
>
>[Patch 2]
>- Patch 2 was completely replaced=2E A new approach for the API is taken,
>  based on Joshua's suggestions=2E
>
>- Link to v2: https://lore=2Ekernel=2Eorg/r/20250517-fw-attrs-api-v2-0-fa=
1ab045a01c@gmail=2Ecom
>
>Changes in v2:
>
>[Patch 1]
> - Include kdev_t=2Eh header
>
>[Patch 2]
> - Use one line comments in fwat_create_attrs()
> - Check propagate errors in fwat_create_attrs()
> - Add `mode` to fwat_attr_config and related macros to let users
>   configure the `current_value` attribute mode
> - Use defined structs in fwat_attr_ops instead of anonymous ones
> - Move fwat_attr_type from config to ops
>
>[Patch 5]
> - Just transition to new API without chaing ABI
>
>- Link to v1: https://lore=2Ekernel=2Eorg/r/20250509-fw-attrs-api-v1-0-25=
8afed65bfa@gmail=2Ecom
>
>---
>Kurt Borja (5):
>      platform/x86: firmware_attributes_class: Add high level API for the=
 attributes interface
>      platform/x86: firmware_attributes_class: Move header to include dir=
ectory
>      platform/x86: samsung-galaxybook: Transition new firmware_attribute=
s API
>      Documentation: ABI: Update sysfs-class-firmware-attributes document=
ation
>      MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
>
>Thomas Wei=C3=9Fschuh (1):
>      platform/x86: firmware_attributes_class: Add device initialization =
methods
>
> =2E=2E=2E/ABI/testing/sysfs-class-firmware-attributes    |   1 +
> MAINTAINERS                                        |   8 +
> drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec |   2 +-
> drivers/platform/x86/firmware_attributes_class=2Ec   | 615 +++++++++++++=
+++++++-
> drivers/platform/x86/firmware_attributes_class=2Eh   |  12 -
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec       |   2 +-
> drivers/platform/x86/lenovo/think-lmi=2Ec            |   2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec          | 246 +++------
> include/linux/firmware_attributes_class=2Eh          | 389 +++++++++++++
> 9 files changed, 1077 insertions(+), 200 deletions(-)
>---
>base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
>change-id: 20250326-fw-attrs-api-0eea7c0225b6

- Derek
