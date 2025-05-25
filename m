Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358E4C6E;
	Sun, 25 May 2025 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748212294; cv=none; b=ZfaRYOqK326cdBXlLQpss3FG044OnmumHmRy9S/gvxPmM9vLCJnbt2wVpxvueISsMT6GjbsGARCwgSeRVS/riHXCpoKQra878pZiuY95c1UIEnVm2RrwJXP7w5z57u3GP5JUhPlErGsGslEYaQ54epHbBczf+oidbGXjRLGhBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748212294; c=relaxed/simple;
	bh=IeMM05OqHnOOhC29RLdPNxztZuvbTiFhqT0KwYHxVt8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bToaSBoFpIjtv8SS7f7O59HCaVRHTe1NgNoZ3bL8tnByD5GrSZtUTOvHjAeEBJqIMv70PemOum4YWHmN3/c67qnU4Jsm/nEO6MPkCycFQInUQ8myQHeOt3ze9yX2iGY4RzWbv9OIMBNacbRkSgh0xNwzn3gM+/egoTVvZMTDKPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlcI6sSF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlcI6sSF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74068f95d9fso1117531b3a.0;
        Sun, 25 May 2025 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748212292; x=1748817092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BNk1HW/GPBBVIki2yiAq9nzP3MYBLWG6yDhALpawHdE=;
        b=UlcI6sSFmKna4AaP3zWAQLdGE/FGyza0kfA3OF1LQ5HvJOaT00f/UYVSJOcqTclReD
         Fg8e3h9zI7AjIQ2zfinJMkry1XE6BA80v9tyxxkXj4VejGWQjKJtq6xbst0AJgYYjn6n
         K0qxMQMFxUfou6soxK0lmMVYOoujs/6GmxXl6g3x7yZHdFzBrbkAA3vhWYw4o2L9fCHC
         8TIpRKM5F/SWWMvJzmaPT2Ume3xWDEkoHsx9foqcEX0CnNlqxeSOjrH6/bubG1wVvcLG
         30OmBkSWRd8D/jshhjQNi5dJlNrrvDB4ByRIXfNfQ0mV2kfpl/vIYNs8IrMX0rUEi1UQ
         X/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748212292; x=1748817092;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNk1HW/GPBBVIki2yiAq9nzP3MYBLWG6yDhALpawHdE=;
        b=dxyqbEGLy8Bjzb9khyCNkaQkiAX9eR2CMegoACg22ukoNFNdNdqykoLy5N2l62JC5k
         dUUfal5jd7bK+goI7mO0eMzbBluiiOTbgMPt/LEcIO7a/KgdKcIQfLQIIwNq550nzdRo
         f+iWsi6dKfG9cTN1BTvDVs1KQ5k63z90Z6r8aOk6XPFBpp3YyXBNa9RD+veI4EvPpiBw
         DWv5kX3c+rni3mZFh/avi/WGVjQ83hrnEPEYHoMuLakKiTd6HXJGTg1+SZPWM+GzEdz/
         ytZTjlZXdThWtmDRDQL0B5PSsEjrNq/RhdVr+juJKIAv2JKUuVVuV7Ri05m2Wkh7l07T
         R7xg==
X-Forwarded-Encrypted: i=1; AJvYcCUp9Cvf217ewfOr976v1zI8QOgwiaKYQMT+4BaANNtsDEJHGiuB5ZjXw3OPBWktwDOz9yOEb/fVKZy679lflF14x2mCcw==@vger.kernel.org, AJvYcCWywklj5zgRVDja1PEqmNO8vCva8QMaxalszOu0X3zakXFDTjN2t8MjkZKvg+vhSOSCB5nTznG/sXzW27WY@vger.kernel.org, AJvYcCXhS3/MKC+DCDdf6V+EbYSpxVaQXi0VMIBhn4H5qa1FbxQ3R3fqKTJlAW3FiBh2FwquGQo/LovKaH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/aS3hts3wJ1BWooTRadsE3MYGjpg+Af8rxgXz+hjuDXutTkO4
	hMD9scie3KZNrCamrJDMymlpzTjOhmyQ1rcNjsa/dcdM8QwIWIfMta3h
X-Gm-Gg: ASbGncs6lz07eUOdRnKnnHGImMoBFNNJrC0pkbKJg/j88aQAXfJi5YETiMsApG1BPjF
	x23b474ZpdzW/gs5GWEbUrqmQvdAe/jZCpy8RsDauZekXb7Pn1Zge/60Z3ojaqy1kPrHDOKbUgy
	H+XqyaSC95YljMiRFVWinnIyW1i5RvcrgtmA+wAvZFKUmp62WRGcOsPo72cWSznl5NtR3IxZ/UN
	ZMStPyMYKevNwvcWvVBplMiaz9BN2Wyb1nBEqaGaqFI1p6N9RAAplqnsCM0W1w98ljQ9qG4aqD0
	m6svro6Cs6mqC6Eot5rQONaLCLxvRb2Bn1PxnvXlmBrv9KSRbXnEfyYEhJxuZFnG5NoQ10Wym8C
	z7rWPabJszm4Ywsdch408BXy6vMBUQtgTviI1vVKf0CEGVA==
X-Google-Smtp-Source: AGHT+IFTk+EvF2W9G//EcorjDe7dKdWV289H14hln+o8U9THUxAgVaqSH5tdMkI3QRz7WvL39iK3ag==
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr10085373b3a.20.1748212292052;
        Sun, 25 May 2025 15:31:32 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877030sm16403042b3a.148.2025.05.25.15.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 15:31:31 -0700 (PDT)
Date: Sun, 25 May 2025 15:31:29 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_0/6=5D_platform/x86=3A_A?=
 =?US-ASCII?Q?dd_Lenovo_WMI_Gaming_Series_Drivers?=
User-Agent: Thunderbird for Android
In-Reply-To: <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com>
References: <20250522015350.471070-1-derekjohn.clark@gmail.com> <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com> <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com>
Message-ID: <755BCB57-A912-44BF-AD6C-6B9AFA33A340@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 25, 2025 2:41:51 PM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linu=
x=2Eintel=2Ecom> wrote:
>On Mon, 26 May 2025, Ilpo J=C3=A4rvinen wrote:
>
>> On Wed, 21 May 2025, Derek J=2E Clark wrote:
>>=20
>> > Adds support for the Lenovo "Gaming Series" of laptop hardware that u=
se
>> > WMI interfaces that control various power settings=2E There are multi=
ple WMI
>> > interfaces that work in concert to provide getting and setting values=
 as
>> > well as validation of input=2E Currently only the "Gamezone", "Other
>> > Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, bu=
t
>> > I attempted to structure the driver so that adding the "Custom Mode",
>> > "Lighting", and other data block interfaces would be trivial in later
>> > patches=2E
>> >=20
>> > This driver attempts to standardize the exposed sysfs by mirroring th=
e
>> > asus-armoury driver currently under review=2E As such, a lot of
>> > inspiration has been drawn from that driver=2E
>> > https://lore=2Ekernel=2Eorg/platform-driver-x86/20250319065827=2E5347=
8-1-luke@ljones=2Edev/#t
>> >=20
>> > The drivers have been tested by me on the Lenovo Legion Go and Legion=
 Go
>> > S=2E
>> >=20
>> > Suggested-by: Mario Limonciello <superm1@kernel=2Eorg>
>> > Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> > Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > ---
>> > v11:
>> >   - Fix formmating issues=2E
>>=20
>> Thanks for the update, I've applied this now into the review-ilpo-next=
=20
>> branch=2E BUT, this is very late in the cycle now and if there's a buil=
d=20
>> issue (or LKP doesn't build test it in reasonable time), I'll have to d=
rop=20
>> this series and postpone it into the next cycle as I don't want to dela=
y=20
>> the main PR to Linus too long=2E
>>=20
>> But lets hope for the best, I think some depends on issues were fixed=
=20
>> earlier (IIRC), so hopefully it works good enough now=2E :-)

>Hmpf, these give me a few new warnings related to this series:
>
>make W=3D1 drivers/platform/x86/
>make C=3D2 drivers/platform/x86/
>
>=2E=2E=2EI really don't know why sparse complains about the lock context=
=20
>imbalance though, those functions use guard()=2E

Hmm, I'll take a look at it=2E

Is there a comprehensive list of all tests that need to be run? I'd like t=
o improve my process to avoid these in the future=2E

>There's also a copy-paste error:
>
> * lwmi_gz_profile_get_get() - Get the current platform profile=2E
>
>=2E=2E=2E_get_get -> =2E=2E=2E_set
>Get -> Set


Do you want me to submit v12 whenever it's ready,  or wait for the merge w=
indow to open? Trying to avoid too much noise on your end=2E

Thanks,
- Derek
