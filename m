Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84E26FA5F;
	Tue,  6 May 2025 18:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746557755; cv=pass; b=Ye5XHLn9KTWHdpOEvg3th1ScBFTxYGJnLEEYp8PQFxeL8M/fU4lKcdJuHnIbz0M2fkchc+7I1MenCESoZnP8YHXlB2POxmQ4FhUmETT/WI0bijMuZPgOELjbt/MDG2Gr5+dkpXADLyuE/ijfQQriALTDDmJkKCsoAXHXiZnyYJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746557755; c=relaxed/simple;
	bh=+V9c9P+XLCP6epmmMfl8cUF9PvnqAjKBYuDSNlAXMnQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R/OrplYLGbm1oa3v/0TUlEF29nbWiMBVXnD9F+ckR2pfPFquyuqvTJHOSWyPsS0BYWhLWo1F15ydr37tKIm+CQ6zgf/q/gCrRaTcTX+sYlg2gRoofY0kndjBrP5TJCBjsTbchM2jYEcxvOj3ejo5EV4X7LgmFYFWxvmR9mM031M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nOUSIUtr; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nOUSIUtr"
ARC-Seal: i=1; a=rsa-sha256; t=1746557727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KwnPEahn9G+egIp0b5+OMaSwG/q5yfrWq88d17l9bkWBIgXCQWegMoiTcP3SVOqdd8k/IGx/csVmeCrlRgxTc0E2kcf3+hSJvvFVhWgcSCm+1Zh26FPNhChg2mjRmltcm6g++Clh4Mi93lV9IWqrR4hEd3KhubS96fmThG7NsnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746557727; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=50LGUANZtRF4CAXc8c+CQnUyp7TR6CVRCU2iSaAz4DA=; 
	b=T+yV+qPOi6R3UBycJ/rhxomsUnQmRnwYnIrQHcAM1SymG1+pZWq7f0Jxv/76FiiPav0z1JgWmrKqSwpJbHIAEZeZRo3L+UqqnsT3OQSeJVUaYfayi/ZXY/lx9DKg2cb0EoUoro92LWX5ktCyzIQbH81oWu/KLL2MHKRQ94CRBrw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746557727;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=50LGUANZtRF4CAXc8c+CQnUyp7TR6CVRCU2iSaAz4DA=;
	b=nOUSIUtryZBqY9eUXNksP7xQTW20G0nnAx1CS+i9EHNg8B3TlDn2jWpdt5HBijy4
	hnRwN0rXS+8iyezH/UakgakxX5ZkC4ZVaFuV5pyVJ8eBvKkJgY19euzohriRfx21yXk
	+sgFONWR+EfUf7vAuZSDU5xBZ6e7aQ+cLW3/Fy7w=
Received: by mx.zohomail.com with SMTPS id 1746557723958215.91670959458827;
	Tue, 6 May 2025 11:55:23 -0700 (PDT)
Message-ID: <d71e1b74a583cf2651658151751c578218861032.camel@rong.moe>
Subject: Re: [PATCH] platform/x86/amd/pmc: Declare quirk_spurious_8042 for
 MECHREVO Wujie 14XA (GX4HRXL)
From: Rong Zhang <i@rong.moe>
To: Mingcong Bai <jeffbai@aosc.io>, Mario Limonciello
	 <mario.limonciello@amd.com>, Runhua He <hua@aosc.io>, 
	platform-driver-x86@vger.kernel.org
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Xinhui Yang <cyan@cyano.uk>, Yemu
 Lu	 <prcups@krgm.moe>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de
 Goede	 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org
In-Reply-To: <0c355c40-defa-4486-a89a-39f1ad3aba03@aosc.io>
References: <20250506112514.446784-1-hua@aosc.io>
	 <f7200e0f-d6d5-4fb8-9701-3f97d1ab64fa@amd.com>
	 <0c355c40-defa-4486-a89a-39f1ad3aba03@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 May 2025 02:54:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.1-1 
X-ZohoMailClient: External

Hi all,

On Tue, 2025-05-06 at 22:02 +0800, Mingcong Bai wrote:
> Hi Mario,
>=20
> =E5=9C=A8 2025/5/6 21:29, Mario Limonciello =E5=86=99=E9=81=93:
> > On 5/6/2025 6:25 AM, Runhua He wrote:

[...]

> > > I have only matched the motherboard model, as the same chassis and
> > > motherboard (GX4HRXL) combination may be used under different product
> > > names.

Runhua's statement is *only* correct to a certain extent. (see below)

> > > Suggested-by: Mingcong Bai <jeffbai@aosc.io>
> > > Suggested-by: Xinhui Yang <cyan@cyano.uk>
> > > Suggested-by: Rong Zhang <i@rong.moe>
> > > Fixes: a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard wakeup o=
n=20
> > > AMD Framework 13")
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4166
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Link: https://zhuanldan.zhihu.com/p/730538041
> > > Tested-by: Yemu Lu <prcups@krgm.moe>
> > > Signed-off-by: Runhua He <hua@aosc.io>
> > > ---
> > > =C2=A0 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
> > > =C2=A0 1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/=20
> > > platform/x86/amd/pmc/pmc-quirks.c
> > > index b4f49720c87f..e01012d5ecd0 100644
> > > --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > > +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > > @@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] =
=3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > > +=C2=A0=C2=A0=C2=A0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "MECHREVO Wuji=
e 14 Series (GX4HRXL)",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D &quirk_s=
purious_8042,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_MATCH(DMI_BOARD_NAME, "GX4HRXL"),
> >=20
> > This feels like it might be too wide.=C2=A0 Could we match a system ven=
dor as=20
> > well?
>=20
> Possibly. There are two known system vendors using this motherboard -=20
> TongFang and MECHREVO (MECHREVO is a marque owned by TongFang).

There are plain "GX4HRXL" and "WUJIE14-GX4HRXL". Their BIOS/firmware
are different - this difference is not just about marketing.

Runhua's statement only applies to plain "GX4HRXL", which is not his
model. All seen editions are:
   - Juno GX4HRXL [1]
   - TongFang GX4HRXL [2]

Comparing [1] and [2]:

   diff --git a/juno b/tongfang
   index 88a71da..c6846eb 100644
   --- a/juno
   +++ b/tongfang
   @@ -1,4 +1,4 @@
   -# dmidecode 3.6
   +# dmidecode 3.5
    Getting SMBIOS data from sysfs.
    SMBIOS 3.5.0 present.
    Table at 0x9A92D000.
   @@ -28,7 +28,7 @@ BIOS Information
   =20
    Handle 0x0001, DMI type 1, 27 bytes
    System Information
   -	Manufacturer: Juno
   +	Manufacturer: TongFang
    	Product Name: GX4HRXL
    	Version: Standard
    	Serial Number: --
    [... SO-DIMM and PCIe ...]


As for "WUJIE14-GX4HRXL", the only model I've seen is:
   - MECHREVO WUJIE14XA [3]

Comparing [2] and [3]:

   diff --git a/tongfang b/mechrevo
   index c6846eb..0f132a2 100644
   --- a/tongfang
   +++ b/mechrevo
   @@ -1,13 +1,13 @@
   -# dmidecode 3.5
   +# dmidecode 3.6
    Getting SMBIOS data from sysfs.
    SMBIOS 3.5.0 present.
   -Table at 0x9A92D000.
   +Table at 0x9A92C000.
   =20
    Handle 0x0000, DMI type 0, 26 bytes
    BIOS Information
    	Vendor: American Megatrends International, LLC.
   -	Version: N.1.14PCS05
   -	Release Date: 10/24/2024
   +	Version: N.1.14MRO19
   +	Release Date: 01/17/2025
    	Address: 0xF0000
    	Runtime Size: 64 kB
    	ROM Size: 32 MB
   @@ -23,24 +23,24 @@ BIOS Information
    		BIOS boot specification is supported
    		Targeted content distribution is supported
    		UEFI is supported
   -	BIOS Revision: 1.5
   -	Firmware Revision: 1.39
   +	BIOS Revision: 1.19
   +	Firmware Revision: 2.8
   =20
    Handle 0x0001, DMI type 1, 27 bytes
    System Information
   -	Manufacturer: TongFang
   -	Product Name: GX4HRXL
   +	Manufacturer: MECHREVO
   +	Product Name: WUJIE14XA
    	Version: Standard
    	Serial Number: --
    	UUID: --
    	Wake-up Type: Power Switch
   -	SKU Number: 0001
   -	Family: HPT
   +	SKU Number: WUJIE14
   +	Family: Mechrevo WUJIE Series
   =20
    Handle 0x0002, DMI type 2, 15 bytes
    Base Board Information
   -	Manufacturer: TongFang
   -	Product Name: GX4HRXL
   +	Manufacturer: MECHREVO
   +	Product Name: WUJIE14-GX4HRXL
    	Version: Standard
    	Serial Number: --
    	Asset Tag: --
   @@ -54,7 +54,7 @@ Base Board Information
   =20
    Handle 0x0003, DMI type 3, 22 bytes
    Chassis Information
   -	Manufacturer: Standard
   +	Manufacturer: MECHREVO
    	Type: Notebook
    	Lock: Not Present
    	Version: Standard
   @@ -88,7 +88,7 @@ OEM Strings
    	String 8: Standard
    	String 9: Standard
    	String 10: Standard
   -	String 11: FBM-GX4HRXL0177PCS
   +	String 11: FGM-GX4HRXL0202101
    	String 12: GX4HRXL
    	String 13: Standard
    	String 14: Standard
   @@ -122,11 +122,11 @@ Unknown Type
    Handle 0x000A, DMI type 45, 26 bytes
    Firmware Inventory Information
    	Firmware Component Name: BIOS Firmware
   -	Firmware Version: N.1.14PCS05
   -	Firmware ID: D968671D-72E2-5CA3-9E09-0E48EA102BDC
   -	Release Date: 10/24/2024
   +	Firmware Version: N.1.14MRO19
   +	Firmware ID: 0145F8DC-000F-5BDE-8ACB-8AD00CAE8FFE
   +	Release Date: 01/17/2025
    	Manufacturer: Standard
   -	Lowest Supported Firmware Version: N.1.14PCS05
   +	Lowest Supported Firmware Version: N.1.14MRO19
    	Image Size: 32 MB
    	Characteristics:
    		Updatable: Yes
    [... PCIe ...]


Look for BIOS versions whose release dates are the closest between the
two [4] [5]:

   diff --git a/tongfang-1.13 b/mechrevo-1.13
   index 3970b9a..a617bbc 100644
   --- a/tongfang-1.13
   +++ b/mechrevo-1.13
   @@ -1,13 +1,13 @@
    # dmidecode 3.6
    Getting SMBIOS data from sysfs.
    SMBIOS 3.5.0 present.
   -Table at 0x9A92D000.
   +Table at 0x9A92C000.
   =20
    Handle 0x0000, DMI type 0, 26 bytes
    BIOS Information
    	Vendor: American Megatrends International, LLC.
   -	Version: N.1.13PCS03
   -	Release Date: 09/06/2024
   +	Version: N.1.13MRO14
   +	Release Date: 08/19/2024
    	Address: 0xF0000
    	Runtime Size: 64 kB
    	ROM Size: 32 MB
   @@ -23,24 +23,24 @@ BIOS Information
    		BIOS boot specification is supported
    		Targeted content distribution is supported
    		UEFI is supported
   -	BIOS Revision: 1.3
   -	Firmware Revision: 1.33
   +	BIOS Revision: 1.14
   +	Firmware Revision: 1.32
    [...]
   @@ -88,7 +88,7 @@ OEM Strings
    	String 8: Standard
    	String 9: Standard
    	String 10: Standard
   -	String 11: FBM-GX4HRXL0177PCS
   +	String 11: FGM-GX4HRXL0167102
    	String 12: GX4HRXL
    	String 13: Standard
    	String 14: Standard
   @@ -122,11 +122,11 @@ Unknown Type
    Handle 0x000A, DMI type 45, 26 bytes
    Firmware Inventory Information
    	Firmware Component Name: BIOS Firmware
   -	Firmware Version: N.1.13PCS03
   -	Firmware ID: D968671D-72E2-5CA3-9E09-0E48EA102BDC
   -	Release Date: 09/06/2024
   +	Firmware Version: N.1.13MRO14
   +	Firmware ID: 0145F8DC-000F-5BDE-8ACB-8AD00CAE8FFE
   +	Release Date: 08/19/2024
    	Manufacturer: Standard
   -	Lowest Supported Firmware Version: N.1.13PCS03
   +	Lowest Supported Firmware Version: N.1.13MRO14
    	Image Size: 32 MB
    	Characteristics:
    		Updatable: Yes
    [...]


Three bits here hint that these two variants are not completely
identical:
   - BIOS/firmware updates are not synced.
   - Different characters in their BIOS version strings, i.e., PCS vs MRO.
   - FBM-GX4HRXL0177PCS vs FGM-GX4HRXL0202101 vs FGM-GX4HRXL0167102.

I guess these two variants were developed by two different teams
(global/China) that shared some common codebase. The difference is
probably because of the divergence of pre-installed software to
manipulate BIOS options in Windows. I highly suspect the broken EC
state machine is related to such software.

[1]: https://linux-hardware.org/?probe=3D22e1f510a2&log=3Ddmidecode
[2]: https://linux-hardware.org/?probe=3D0475501c8c&log=3Ddmidecode
[3]: https://linux-hardware.org/?probe=3Dd9af608109&log=3Ddmidecode
[4]: https://linux-hardware.org/?probe=3D599c1edc57&log=3Ddmidecode
[5]: https://linux-hardware.org/?probe=3D7c2e3b925b&log=3Ddmidecode

> See: https://linux-hardware.org/?probe=3D6783d8fc06

This is TongFang GX4HRXL and uses a different BIOS then Runhua's as
mentioned above.

> Runhua, maybe we could make two entries here?

Since this is a platform firmware bug, and given the information we
have, is it too soon to say plain "GX4HRXL" suffers from the same bug?

I agree with Mario here, but in a slightly different manner, i.e.,
narrowing the DMI_BOARD_NAME match down to "WUJIE14-GX4HRXL".

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c
b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b4f49720c87f..2e3f6fc67c56 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] =3D {
 			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
 		}
 	},
+	{
+		.ident =3D "MECHREVO Wujie 14X (GX4HRXL)",
+		.driver_data =3D &quirk_spurious_8042,
+		.matches =3D {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE14-GX4HRXL"),
+		}
+	},
 	{}
 };

Note on `s/14 Series/14X/': while glancing linux-hardware.org, I found
Wujie 14 Series includes 14, 14S, 14 Pro, 14XA. They are all disparate
from each other. 14X is 14XA's marketing name.

> Best Regards,
> Mingcong Bai

Regards,
Rong
