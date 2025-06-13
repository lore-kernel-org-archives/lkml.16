Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE362E11A8;
	Fri, 13 Jun 2025 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824745; cv=none; b=uMjbcL/HkK3UeDnst3ZeZg3P5KMcuOwVwdmHUgnynkp03RZK4wnccRgeKUE5QxLO7g3jPNok6t+ihYSxCUHf/1rRj1ItQvIYFU+fhssGfGI+H+GEO657OOYwQl1Rdwe+ecaorSiaBkiYD6G3tdAQimJSi+VbCj/Em60CmlWP8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824745; c=relaxed/simple;
	bh=7nxxCzygmafMze1zm3p+C7sk/SkcGsulU3y8eIF1HT8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=p3DnGwgt8XNjTv6SsTNJG1GPtJGdVGrIUqI764iBofzicKSzp8YQUrbm5SNwy2Zs3xmcpLalcHSubI3Ee7mBtc3+WPBnHVSNNHW2nbfbHTPqlC+5sSl3pF59gPgSOZ4LYgme7BVQBbE+LW6/U2M4CO82GnG54/3adfp1l35WSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpdH5M1w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpdH5M1w"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350fc2591dso21496785ad.1;
        Fri, 13 Jun 2025 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749824743; x=1750429543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbMJZEp+OXeJUxEccMiWTpp37iHTjZ0DWM07t8/kq5w=;
        b=LpdH5M1wg1543yoDj6zeJDzKL+s6ImWqymRDuUFhI5J7bwA6GsSERsUnYbmxL1eyVa
         cCKAAJrMDuHkejeHadtrTW0Alw278S8Zn3A91arWQWkGKj9Txw57jCdoN3IjV8Do0SCd
         y9hE0bXasaTQDETsvkodgP8uSuEJC0V1wLJhUsyE19YBeu0YCpeWkbemJNH7x6YXvUES
         CtVQGBpgXX46AcZ+2XfSvrOEVHTj71vKWOfGVGci5NHYllN0M2MQ+aolYuCYfL4o1GQc
         8GYMBddWu1DWYFvkNgai/2/lxYCzV/hhJfz3Rl2nFfrr+sX+sPpXEFf4cQKsEzLrrApM
         IyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824743; x=1750429543;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbMJZEp+OXeJUxEccMiWTpp37iHTjZ0DWM07t8/kq5w=;
        b=lMtDfnl6rjWZ+505DPz3HKLoEfV8OkcsF2wRVwQghRprGbRx+cHWjVP/T5X56JBmji
         bJfkKf+JLCmHCWmMAW64Ds2BrHGbYWpPwl56oQsDnyf8QDgM0ZLCTfVJWcHPH7fEhMzw
         sLZ4zQJAeecP75ybCe3KQ64HOR4WX2Fb9LvqUh5m8IwHyrjvLJ1I4f4EdfTdf19Jm+gk
         YlO1Pu2i+zh7dbRujErNs2Cnd0dIZyUe16HZH/LKmx0KdGSjDdlQqdTVfhzU+qaQt8DT
         vtYuZZfLzxSA/idrSCLroRcD26FfSpO6CzkbIb3JaGc98b5AnzGy4S6x/Wb+9Wv6R9NK
         7pgg==
X-Forwarded-Encrypted: i=1; AJvYcCUZDM+LQYq+4CoPTquavlEWp0yQnk5HcVhoLsHE7aw/KM1edx/x1wOwOxvUr3i8bGGHsOJhvUIcP24=@vger.kernel.org, AJvYcCUwjizICdkozNacBPmtSt7QKa85WW+TfQAsi7sGwDFGnmVCOv5W0CGEmNr7hyA1ytEhIFmPIkiimpMMWlTu@vger.kernel.org, AJvYcCW5V6RDDbzbqNmBKx6XHnMuTdA6DmjKjayrSWjZ25vuD8iUP5km/6eH11ravx0i/f1jB6qccGvGJdYiphg+HYEut+nPBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxosNqFYbg/4Sm2mlhET28AXgzzLGp5QcpxScskV9USV+9afOOw
	2ywES50knCWjF9kKcEwJYAaAcfzNWgd2JJQXHqAOeUCjMgd4js96T31l
X-Gm-Gg: ASbGncv0H0ZT8btOJi/YY5CIAGP8+lhStVxGigFVzkurCR1JJa8ZkSWV7K5N8heoBJ/
	+xAKcFIYkJE7TncUcWjNH9Ch16cJxewwCYxCrgreeuPWv8X/pmwe9Fe309LfzFxFD05jEL/euO5
	3rmMTy58j86JkGVAb/EMVylNgAD1oHR8y4n4jTK42dgVj20q9LnIrIgoENes/eMDm0oinCH/yka
	G+bB+BfBcLoXNBotnyUoxIQZ89iubO/a1q3J/Hvqog+03ISIVPehJ52dqceYxlDIZOboQ8vgQ4h
	VtHUyffq7u/5LdLv5CBS7vfVadAQds10JkD4xP0fXS5eW/kRq/k+ishX7lOang58C5BcDw==
X-Google-Smtp-Source: AGHT+IFSAUyJOYrFNH5kSIABO4B+RufRr/zidEOc71Ly1nTcpZMnFAZ9v7LZ/EoOYEq6B/ckMPhekw==
X-Received: by 2002:a17:902:ecca:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-23667a28c67mr11814005ad.5.1749824742839;
        Fri, 13 Jun 2025 07:25:42 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb91:3ee2:c0aa:ad2:cc58:51f0:a267])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c20bsm14914095ad.19.2025.06.13.07.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:25:42 -0700 (PDT)
Date: Fri, 13 Jun 2025 07:25:39 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v12_0/6=5D_platform/x86=3A_A?=
 =?US-ASCII?Q?dd_Lenovo_WMI_Gaming_Series_Drivers?=
User-Agent: Thunderbird for Android
In-Reply-To: <facbb66b-ea34-bc57-d673-adb84f79fb8d@linux.intel.com>
References: <20250609185027.7378-1-derekjohn.clark@gmail.com> <facbb66b-ea34-bc57-d673-adb84f79fb8d@linux.intel.com>
Message-ID: <8933A696-ABA4-4C79-90D3-347016B26911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 13, 2025 2:07:14 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@lin=
ux=2Eintel=2Ecom> wrote:
>On Mon, 9 Jun 2025, Derek J=2E Clark wrote:
>
>> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
>> WMI interfaces that control various power settings=2E There are multipl=
e WMI
>> interfaces that work in concert to provide getting and setting values a=
s
>> well as validation of input=2E Currently only the "Gamezone", "Other
>> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
>> I attempted to structure the driver so that adding the "Custom Mode",
>> "Lighting", and other data block interfaces would be trivial in later
>> patches=2E
>>=20
>> This driver attempts to standardize the exposed sysfs by mirroring the
>> asus-armoury driver currently under review=2E As such, a lot of
>> inspiration has been drawn from that driver=2E
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250319065827=2E53478-=
1-luke@ljones=2Edev/#t
>>=20
>> The drivers have been tested by me on the Lenovo Legion Go and Legion G=
o
>> S=2E
>>=20
>> Suggested-by: Mario Limonciello <superm1@kernel=2Eorg>
>> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v12:
>>  - Fix warnings from make W=3D1
>> v11:
>> v10:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250515182224=2E8277-1=
-derekjohn=2Eclark@gmail=2Ecom/
>> v9:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250508235217=2E12256-=
1-derekjohn=2Eclark@gmail=2Ecom/
>> v8:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250505010659=2E145098=
4-1-derekjohn=2Eclark@gmail=2Ecom/
>> v7:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250503000142=2E119035=
4-1-derekjohn=2Eclark@gmail=2Ecom/
>> v6:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250428012029=2E970017=
-1-derekjohn=2Eclark@gmail=2Ecom/
>> v5:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250408012815=2E103235=
7-1-derekjohn=2Eclark@gmail=2Ecom/
>> v4:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250317144326=2E5850-1=
-derekjohn=2Eclark@gmail=2Ecom/
>> v3:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250225220037=2E16073-=
1-derekjohn=2Eclark@gmail=2Ecom/
>> v2:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20250102004854=2E14874-=
1-derekjohn=2Eclark@gmail=2Ecom/
>> v1:
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20241217230645=2E15027-=
1-derekjohn=2Eclark@gmail=2Ecom/
>>=20
>> Derek J=2E Clark (6):
>>   platform/x86: Add lenovo-wmi-* driver Documentation
>>   platform/x86: Add lenovo-wmi-helpers
>>   platform/x86: Add Lenovo WMI Events Driver
>>   platform/x86: Add Lenovo Capability Data 01 WMI Driver
>>   platform/x86: Add Lenovo Gamezone WMI Driver
>>   platform/x86: Add Lenovo Other Mode WMI Driver
>>=20
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-gamezone=2Erst       | 203 ++++++
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          | 108 +++
>>  MAINTAINERS                                   |  12 +
>>  drivers/platform/x86/Kconfig                  |  41 ++
>>  drivers/platform/x86/Makefile                 |   5 +
>>  drivers/platform/x86/lenovo-wmi-capdata01=2Ec   | 302 ++++++++
>>  drivers/platform/x86/lenovo-wmi-capdata01=2Eh   |  25 +
>>  drivers/platform/x86/lenovo-wmi-events=2Ec      | 196 ++++++
>>  drivers/platform/x86/lenovo-wmi-events=2Eh      |  20 +
>>  drivers/platform/x86/lenovo-wmi-gamezone=2Ec    | 409 +++++++++++
>>  drivers/platform/x86/lenovo-wmi-gamezone=2Eh    |  20 +
>>  drivers/platform/x86/lenovo-wmi-helpers=2Ec     |  74 ++
>>  drivers/platform/x86/lenovo-wmi-helpers=2Eh     |  20 +
>>  drivers/platform/x86/lenovo-wmi-other=2Ec       | 665 ++++++++++++++++=
++
>>  drivers/platform/x86/lenovo-wmi-other=2Eh       |  16 +
>>  15 files changed, 2116 insertions(+)
>>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-other=2Erst
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01=2Eh
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-events=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-events=2Eh
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone=2Eh
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers=2Eh
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Eh
>
>Hi Derek,
>
>Could you please rebase this on top of for-next placing the files under=
=20
>lenovo/ folder which we just created=2E I could have easily changed the=
=20
>placement of the files themselves, but making the Kconfig & Makefile=20
>changes into the new files while applying would have been more=20
>complicated=2E It is better you do it so I won't end up messing up anythi=
ng=2E
>
>There's the lenovo-target in lenovo/Makefile which will auto add the=20
>'lenovo-' prefix to the files so you can basically rename the files like=
=20
>this:
>
>drivers/platform/x86/lenovo-wmi-other=2Ec ->
>drivers/platform/x86/lenovo/wmi-other=2Ec
>
>=2E=2E=2Eand add them using that lenovo-target=2E
>

Sure=2E I'm on travel so it may be a few days=2E I'll attempt to get it do=
ne today if I can though=2E

Should I change the docs at all for this?

Cheers,
- Derek
