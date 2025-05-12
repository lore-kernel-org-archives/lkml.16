Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948521EB3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053694; cv=none; b=o/X1I/eCBL2+Tfl376IrkI528A6FULGY5Lf2CWTyZNC3Xi2wk/4cQyyXdHPbRG9ElSyvM/1RydfWLJU+Fa7mnZ4VNFsF0+Eg8PEH9QLCQ1AGoS/qc97GZCb4wj/Ou9Wgqpih5bgCj8NQB4YsYMS4GqKvMgz8KYPrd0eqUSW0EGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053694; c=relaxed/simple;
	bh=helHVFcCc6O5Yr1H5yxEwX++JjEl7jBlkEFp8qSNyvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z080UAVVJuHrTfgE+O0rfPL/+MzzKSFlNr41HdFzv/2N7GCcA/gN55Qonr0GHnp1K+NYz/YogWI6fz2pXCEJ9yfcVasAA/BqeE8/vsBTyGM0fnH0pfcYidSNBrntPfs/ORaPpQcXgWb4eRMAMvq8ypIpnFlOVq6DSbRXkjd7xWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0AYRTqa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0AYRTqa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e19c71070so5413425ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747053692; x=1747658492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MutJbEZ4KqbPzVVXIepvw71AaZnl8Z+syetzesd98PA=;
        b=N0AYRTqaiDRwQY9Ltmv7HjWXeyCaX0GEEzavb0HKozNjporIHVAFzqmNcGMEQcMWh7
         Aij7zbdQnZc4vNmxY7pKhanNDM1Kk/ISW5RtVCuYxTsQ+I066r5VfGKa8FBuhwjMqNjX
         edlOcEtuMMHvG7L+WrtMS42RPjtGOdSaFr6ZQlr0cRm6jhBMAAIiVwH1Pu2sNjC1ItVH
         w6nRs+i2TfHYnmhglqbR5gqaN1adgVkdIVN36qiiKh77H3NnQ+uaOmxy2oYxT/2ysv0Z
         YjMKAl6euGI8V05e5GRJVTGK3fNLctMpQuBMNQAsZ17i0oDUJbRBVVGaQd3lnMjTiEnS
         VHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053692; x=1747658492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MutJbEZ4KqbPzVVXIepvw71AaZnl8Z+syetzesd98PA=;
        b=akWAqLcs7EX5cCRmlyqMQS+u6QHl1NsHKmXLJ6mLdQjjLQm4uNmZ3+u7Nyyy8bcOF4
         QuNg9lXvnCfMadiTNlZg4m0zahKEXdhc5UEV9Xnh/arGSiV+73y+GCHsqEy4TAilbcVh
         nOMg1LeCpSfHbMlOidILsja/9Rs9e8p058KdSPtVAYx/OowBvEdVL7w5qIA3x0VFysFA
         AkF4sfp22OqNLO3CrSRBnVQ57MBEHr/Zs9oX7mS2PfWO634EDZtXq64ZyA8d6dEsCXmc
         aBdGcIpzv/B+A6pCBMpmpXMDxt0D/mH+reuC68WFo2CrT0HhmpBrANbZCrniIJfaWbXl
         mbBg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmtqA52Iklvl0UMG2NTWQ2HtzVnotCU3BXFKonvvOz2scn+eBw63yizl23mUUlwVySuwJD4IH96DS4bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza35XvN+/1YZlCcy7vacFr38mPVoM1JRhnHmWGuBW5LC7VkW8r
	eiPY+kxZNQ03wLOEqYz/kY+DAjBO7cV5C0pIUOFFOeY2lUuO8FW9ONFW3Sd5tWFfaZYViiXJfyL
	yoNZd3c+YdIFJmygmQo725kN17nJwKQ==
X-Gm-Gg: ASbGncuNHk2zdiUQCUWmaAmpbVTQn20RPPQKwZEAdRh5SG0a07JT0s7E3DTHet5Dfgy
	DXtm7m7VacmU0rddAMuO7IspBfVqJzE8S2foiKdFt48UoKeZpC+QmahNPxiMMRT5EiLZY0vbds0
	HcU4XKLscCQX+jmwjJjT6bdiTsex1e0QqZ
X-Google-Smtp-Source: AGHT+IFIoHC6h76i04lL5JdOrswiHkOu0hpGLSJUm0tZg8OxabrlW/HK3gRAosNK2iJ+WU/yC3ZPkoC009XOxyIPox8=
X-Received: by 2002:a17:902:ecd1:b0:224:1001:6777 with SMTP id
 d9443c01a7336-22fc8b402b1mr77295035ad.4.1747053691556; Mon, 12 May 2025
 05:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512121836.GDaCHnHNjeBwfyV0hh@fat_crate.local>
In-Reply-To: <20250512121836.GDaCHnHNjeBwfyV0hh@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 08:41:20 -0400
X-Gm-Features: AX0GCFtEW70RFySJ-eju3_aj0bruQxn5rRbYMYhYshvRj4mOXdanDYPHP-lO7jw
Message-ID: <CADnq5_Nq0yzyaYGMHHjjvmZdAAup4PHvvxTLjH9+KbMeeQkneA@mail.gmail.com>
Subject: Re: amdgpu RENOIR funky complaints in dmesg
To: Borislav Petkov <bp@alien8.de>, Wayne Lin <Wayne.Lin@amd.com>, 
	"Wentland, Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
	Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Wayne, Leo, Harry

On Mon, May 12, 2025 at 8:28=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> Hey folks,
>
> this is rc6 + tip/master on a Zen2 RN laptop.
>
> Needless to say, the complaints are brand new.
>
> Thx.
>
> [    0.875804] ACPI: bus type drm_connector registered
> [    0.877903] [drm] Initialized vgem 1.0.0 for vgem on minor 0
> [    0.880430] [drm] Initialized vkms 1.0.0 for vkms on minor 1
> [    0.922159] platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
> [   11.655127] [drm] amdgpu kernel modesetting enabled.
> [   11.833426] amdgpu: Virtual CRAT table created for CPU
> [   11.835726] amdgpu: Topology: Add CPU node
> [   11.837865] amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
> [   11.839494] [drm] initializing kernel modesetting (RENOIR 0x1002:0x163=
6 0x17AA:0x5099 0xD1).
> [   11.842925] [drm] register mmio base: 0xFD300000
> [   11.843821] [drm] register mmio size: 524288
> [   11.866875] amdgpu 0000:06:00.0: amdgpu: detected ip block number 0 <s=
oc15_common>
> [   11.867854] amdgpu 0000:06:00.0: amdgpu: detected ip block number 1 <g=
mc_v9_0>
> [   11.868731] amdgpu 0000:06:00.0: amdgpu: detected ip block number 2 <v=
ega10_ih>
> [   11.869567] amdgpu 0000:06:00.0: amdgpu: detected ip block number 3 <p=
sp>
> [   11.870389] amdgpu 0000:06:00.0: amdgpu: detected ip block number 4 <s=
mu>
> [   11.871295] amdgpu 0000:06:00.0: amdgpu: detected ip block number 5 <d=
m>
> [   11.872154] amdgpu 0000:06:00.0: amdgpu: detected ip block number 6 <g=
fx_v9_0>
> [   11.872984] amdgpu 0000:06:00.0: amdgpu: detected ip block number 7 <s=
dma_v4_0>
> [   11.873802] amdgpu 0000:06:00.0: amdgpu: detected ip block number 8 <v=
cn_v2_0>
> [   11.874629] amdgpu 0000:06:00.0: amdgpu: detected ip block number 9 <j=
peg_v2_0>
> [   11.875457] amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
> [   11.876246] amdgpu: ATOM BIOS: 113-RENOIR-026
> [   11.916515] amdgpu 0000:06:00.0: vgaarb: deactivate vga console
> [   11.917441] amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ) fea=
ture enabled
> [   11.918275] amdgpu 0000:06:00.0: amdgpu: MODE2 reset
> [   11.920343] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,=
 fragment size is 9-bit
> [   11.921245] amdgpu 0000:06:00.0: amdgpu: VRAM: 512M 0x000000F400000000=
 - 0x000000F41FFFFFFF (512M used)
> [   11.922102] amdgpu 0000:06:00.0: amdgpu: GART: 1024M 0x000000000000000=
0 - 0x000000003FFFFFFF
> [   11.923005] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
> [   11.923822] [drm] RAM width 128bits DDR4
> [   11.927674] [drm] amdgpu: 512M of VRAM memory ready
> [   11.928527] [drm] amdgpu: 7569M of GTT memory ready.
> [   11.929974] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [   11.931833] [drm] PCIE GART of 1024M enabled.
> [   11.932659] [drm] PTB located at 0x000000F41FC00000
> [   11.936483] [drm] Loading DMUB firmware via PSP: version=3D0x01010028
> [   11.940719] amdgpu 0000:06:00.0: amdgpu: Found VCN firmware Version EN=
C: 1.21 DEC: 6 VEP: 0 Revision: 0
> [   12.929948] amdgpu 0000:06:00.0: amdgpu: reserve 0x400000 from 0xf41f8=
00000 for PSP TMR
> [   13.019057] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is=
 not available
> [   13.029393] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is=
 not available
> [   13.034982] amdgpu 0000:06:00.0: amdgpu: psp gfx command LOAD_TA(0x1) =
failed and response status is (0x7)
> [   13.036793] amdgpu 0000:06:00.0: amdgpu: psp gfx command INVOKE_CMD(0x=
3) failed and response status is (0x4)
> [   13.037973] amdgpu 0000:06:00.0: amdgpu: Secure display: Generic Failu=
re.
> [   13.038885] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: query securedi=
splay TA failed. ret 0x0
> [   13.040151] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successful=
ly!
> [   13.042348] [drm] Display Core v3.2.325 initialized on DCN 2.1
> [   13.043396] [drm] DP-HDMI FRL PCON supported
> [   13.044896] [drm] DMUB hardware initialized: version=3D0x01010028
> [   13.073956] snd_hda_intel 0000:06:00.1: bound 0000:06:00.0 (ops amdgpu=
_dm_audio_component_bind_ops [amdgpu])
> [   13.085947] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.087463] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.089942] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.090882] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.093284] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.094155] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.096543] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.097394] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.099734] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.100573] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.102937] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.103750] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.106074] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.106964] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.109336] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.110187] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.112599] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.113459] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.115840] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.116698] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.119046] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.119899] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.122234] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.123114] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.125463] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.126282] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.128622] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.129437] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.131730] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.132535] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.134838] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.135643] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.137930] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.138771] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.141164] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.142002] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.144354] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.145133] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.147373] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.148141] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.150425] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.151226] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.153517] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.154260] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.156568] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.157310] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.159568] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.160293] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.162561] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.163241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.165433] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.166145] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.168424] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.169140] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.171397] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.172111] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.174317] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.175157] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.177436] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.178125] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.180371] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.181090] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.183345] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   13.184062] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   13.272389] amdgpu 0000:06:00.0: amdgpu: [drm] Using ACPI provided EDI=
D for eDP-1
> [   13.284163] [drm] kiq ring mec 2 pipe 1 q 0
> [   13.300102] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   13.301009] kfd kfd: amdgpu: Total number of KFD nodes to be created: =
1
> [   13.304093] amdgpu: Virtual CRAT table created for GPU
> [   13.307633] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
> [   13.308735] kfd kfd: amdgpu: added device 1002:1636
> [   13.309670] amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per SH =
8, active_cu_number 7
> [   13.310667] amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on=
 hub 0
> [   13.311465] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM inv e=
ng 1 on hub 0
> [   13.312242] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM inv e=
ng 4 on hub 0
> [   13.312985] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM inv e=
ng 5 on hub 0
> [   13.313712] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM inv e=
ng 6 on hub 0
> [   13.314435] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM inv e=
ng 7 on hub 0
> [   13.315229] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM inv e=
ng 8 on hub 0
> [   13.315997] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM inv e=
ng 9 on hub 0
> [   13.316742] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM inv e=
ng 10 on hub 0
> [   13.317487] amdgpu 0000:06:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv =
eng 11 on hub 0
> [   13.318232] amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng 0 =
on hub 8
> [   13.319114] amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv eng =
1 on hub 8
> [   13.319867] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv eng=
 4 on hub 8
> [   13.320578] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv eng=
 5 on hub 8
> [   13.321284] amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv eng=
 6 on hub 8
> [   13.329495] amdgpu 0000:06:00.0: amdgpu: Runtime PM not available
> [   13.336874] amdgpu 0000:06:00.0: amdgpu: [drm] Using custom brightness=
 curve
> [   13.345049] [drm] Initialized amdgpu 3.63.0 for 0000:06:00.0 on minor =
2
> [   13.365870] fbcon: amdgpudrmfb (fb1) is primary device
> [   13.367117] [drm] pre_validate_dsc:1621 MST_DSC dsc precompute is not =
needed
> [   13.573337] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:3
> [   13.574721] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:3
> [   13.574793] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.575609] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.576327] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.577042] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.577759] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.578521] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.579237] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.579951] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.580667] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.581382] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.582096] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.582811] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.583527] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.584241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.584956] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.585672] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.586387] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.587101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.587816] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.588531] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.589245] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.589960] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.590670] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.591385] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.592101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.592816] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.593530] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.594246] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.594961] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.595676] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.595767] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.596483] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.597198] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.597913] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.598570] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.599286] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.600000] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.600715] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.601431] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.602146] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.602860] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.603575] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.604290] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.605004] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.605719] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.606435] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.607197] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.607912] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.608628] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.609343] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.610058] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.610774] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.611489] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.612204] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.612920] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.613635] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.614351] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.615066] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.615780] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.616495] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.617210] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.617924] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.618009] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.618724] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.619440] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.620155] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.620870] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.621586] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.622301] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.623016] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.623731] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.624447] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.625161] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.625876] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.626570] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.627284] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.627999] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.628714] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.629429] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.630143] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.630858] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.631572] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.632287] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.633002] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.633718] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.634433] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.635196] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.635911] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.636625] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.637341] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.638057] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.638771] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.639487] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   13.640202] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer=
 fail:4
> [   14.151445] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.151460] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.152974] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.152983] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.154517] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.154526] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.156046] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.156054] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.157573] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.157581] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.159099] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.159107] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.160626] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.160634] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.162154] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.162163] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.163681] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.163690] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.165197] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.165205] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.166715] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.166724] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.168243] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.168252] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.169772] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.169780] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.171343] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.171351] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.172871] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.172879] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.174398] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.174406] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.175926] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.175934] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.177453] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.177461] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.178973] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.178982] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.180488] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.180497] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.182015] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.182024] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.183540] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.183548] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.185056] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.185064] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.186578] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.186587] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.188093] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.188101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.189621] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.189629] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.191137] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.191146] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.192666] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.192674] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.194193] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.194201] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.195725] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.195734] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.197241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.197250] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   14.198764] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially w=
ritten
> [   14.198772] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply comma=
nd not ACK: 0x01.
> [   18.646254] amdgpu 0000:06:00.0: [drm] fb1: amdgpudrmfb frame buffer d=
evice
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
