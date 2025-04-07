Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D3228CB7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014680; cv=none; b=PsX2L2ZW06bn5FrWiBfaqOcaFzwNUJs083gqHPVpFyfw7y2JyqCicSl1PUEJg4IthdalcxO3yNEg9r2xyLUI0NQ/up7ObOz79afNctJY41RoTymtQ31J83jKCzj2+wcStQFZTHJdewuta0GkUHIAJnX3pGLM8KmQ8tULcg87TPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014680; c=relaxed/simple;
	bh=iXVamY6u/C2hMSRCsgJ2VHqlYQT+aaLKnmXLyBDSWU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ul+AH/oRpYmzXf3u6bNm4lnaW+zG7Q30IwrBDG0s7aYQ3xcIemO7mYoamgoUC9jys4vq5PCY+7OSc7ILOmuw1ZACGUeaSeMHMYvFXQH4PVBBZacfsjAOtT75AcJ3hV8UCEFBl7w9VLzrn+8diwfbY96Q99hTBDvndbQ7x8OB2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgtTGKt5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgtTGKt5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso2916690a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744014677; x=1744619477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+AuL3DcqV5GVUhiqRc2Nd48VMpJ7TsE4261T2PQP/w=;
        b=VgtTGKt5dP15FHMyNNmHaIN8xK0/hJ42UleOFKsQUs/glFDOhrYZ1V0Q/ifkoD+Ggn
         Ws56pcg98FXJs//crtm09gg9VE/ln4goqD+u1mf7dbRhzRVIwrPL7UVnF+lVTDys7DCe
         gU/6lq34SsAw0S90GiHy2PPFL8th/JLUycmHt3byBR5O1fiRFYPJjTqscrVDi+dgZd8G
         /JTywYmgeKYYjLVmXzn/qLraeev8uMOusCvRYATGBfU6v4iJHMmoLK9gjZg/6cBeuWAI
         2WHu7d61P3ih+1etQIibsOu3TGyL3vhyBWiBKBR+6IvnLsGXVhGwQ8ryZRDASpaQaQIl
         o6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014677; x=1744619477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+AuL3DcqV5GVUhiqRc2Nd48VMpJ7TsE4261T2PQP/w=;
        b=ENviWI7QQ/3HoZpOfwLKirTYYR6imhJ0xAe7JxAap37sqmlfiLGxg378NQi1j8qBaT
         xlesld3V7ZWqWBk8BsLl6Jd18dzIKYSQzK5hh+aQnQyByOF1mKiAFkN54q6L2w+yrRXH
         up6WRH5XDjtvH2pzk6R3VuRz/CHzno3/lapAzI1i9VituWKdCBrv6Hn85gq5Q6+YPlHW
         Q6JJWezXQNzOF/3TjhuXKL9RhdJfnWgKuvwuqYQaDKqFncAYXFxYeO9N8ozYmSe6v7Bh
         +bOq+xv9QH1/LKHa7HABExWzNw3Zdn79q1QKkNqg4+fSfkFkIhhypGYl32ZEuk59b7DH
         6HtA==
X-Forwarded-Encrypted: i=1; AJvYcCVBSWnGqTY7xrpus0EcDk2MMsQ1hpYMazhcdZRlvf0G9HtyyRty2Vqrt24J3rnwc70ReESMeploKfWFG2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbbaD1wWnlEKVpc2PJQRNy7imJeufRasWIoxUCAR4r6kva93g
	WpmB6VnAR+A3MeJsjhXq7fEI7c4oK4uX8bInAKrE3tX/AuROP546lLAgWQExaWgK1X5kemQ2TWg
	iW8b18JfI7z2ziVSijvKYISucEXlsQ7cz
X-Gm-Gg: ASbGncsuRHkAzmMd1M1yNYMmcYkEEU5zQCyx8svh0BM9/fqFL0yRV34es47EZ8dqu7v
	5kl6Z/Exvr+Eek+cVb5rA9tJM1x+2zGTSZi1PF5JSKtf6+pn6foaOWsuGoF20ph/1zJwaeil6/D
	xxgdNNqpUu4PlreRH0Cg/XvD603Q==
X-Google-Smtp-Source: AGHT+IFdlEidcd/UXbYPe0+ffGmcV59rPZtCWYl3VoCyaX0rTErHQvbbAztPP4Te8GdL6Wm/Dl0/8lNIxKUz6dkjmFg=
X-Received: by 2002:a17:90a:c885:b0:2ee:ed1c:e451 with SMTP id
 98e67ed59e1d1-306a4899ec6mr16825306a91.15.1744014677562; Mon, 07 Apr 2025
 01:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407075400.1113177-1-linchengming884@gmail.com> <20250407075400.1113177-4-linchengming884@gmail.com>
In-Reply-To: <20250407075400.1113177-4-linchengming884@gmail.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 7 Apr 2025 16:25:39 +0800
X-Gm-Features: ATxdqUG3x4BK_I5T8_CepJIC9o3-XKfmNfcS4cR5nsg9vjkEEH6eILEeoHEGnzI
Message-ID: <CAAyq3SYUjyXCPqfiXi=dRNkicf9osxMrZ3Mf2-eHJVMUDnRs5g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: macronix: Add fixups for MX25L3255E
To: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for missing the minimum testing requirements.
Here are the details:

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c29e16
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0.=
..|
00000010  c2 00 01 04 60 00 00 ff  ff ff ff ff ff ff ff ff  |....`.........=
..|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
00000030  e5 20 f1 ff ff ff ff 01  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;=
..|
00000040  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 0f 52  |............. =
.R|
00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
00000060  00 36 00 27 9e 49 ff ff  d9 f8 ff ff ff ff ff ff  |.6.'.I........=
..|
00000070
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
cf7b2e5b00388040786877de15f7594fcc064a1b7dbe34393a06d462cc1da9b0
/sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-4S-4S
  opcode        0x38
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 9e 16 c2 9e 16
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x38
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-003fffff |     [   3] | no
zynq> dd if=3D/dev/urandom of=3D/tmp/spi_test bs=3D1M count=3D2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.084038 seconds, 23.8MB/s
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> hexdump /tmp/spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_=
read
zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
0be542d171336e052532d4b4f50b148293f7436f640211644df075da8682f54a  /tmp/spi_=
read
0be542d171336e052532d4b4f50b148293f7436f640211644df075da8682f54a  /tmp/spi_=
test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_=
read
0be542d171336e052532d4b4f50b148293f7436f640211644df075da8682f54a  /tmp/spi_=
test
zynq> mtd_debug info /dev/mtd0
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 4194304 (4M)
mtd.erasesize =3D 65536 (64K)
mtd.writesize =3D 1
mtd.oobsize =3D 0
regions =3D 0

Cheng Ming Lin <linchengming884@gmail.com> =E6=96=BC 2025=E5=B9=B44=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:59=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> SFDP of MX25L3255E is JESD216, which does not include the Quad
> Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> Therefore, it is necessary to correct this setting by late_init.
>
> In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> address mode. However, since the 3-byte address 1-4-4 page program
> is not defined in SFDP, it needs to be configured in late_init.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index 07e0bd0b70a0..4bbd3b651cec 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -58,6 +58,31 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
>         return 0;
>  }
>
> +static int
> +mx25l3255e_late_init_fixups(struct spi_nor *nor)
> +{
> +       /*
> +        * SFDP of MX25L3255E is JESD216, which does not include the Quad
> +        * Enable bit Requirement in BFPT. As a result, during BFPT parsi=
ng,
> +        * the quad_enable method is not set to spi_nor_sr1_bit6_quad_ena=
ble.
> +        * Therefore, it is necessary to correct this setting by late_ini=
t.
> +        */
> +       nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +
> +       /*
> +        * In addition, MX25L3255E also supports 1-4-4 page program in 3-=
byte
> +        * address mode. However, since the 3-byte address 1-4-4 page pro=
gram
> +        * is not defined in SFDP, it needs to be configured in late_init=
.
> +        */
> +       struct spi_nor_flash_parameter *params =3D nor->params;
> +
> +       params->hwcaps.mask |=3D SNOR_HWCAPS_PP_1_4_4;
> +       spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4]=
,
> +                               SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
> +
> +       return 0;
> +}
> +
>  static const struct spi_nor_fixups mx25l25635_fixups =3D {
>         .post_bfpt =3D mx25l25635_post_bfpt_fixups,
>         .post_sfdp =3D macronix_qpp4b_post_sfdp_fixups,
> @@ -67,6 +92,10 @@ static const struct spi_nor_fixups macronix_qpp4b_fixu=
ps =3D {
>         .post_sfdp =3D macronix_qpp4b_post_sfdp_fixups,
>  };
>
> +static const struct spi_nor_fixups mx25l3255e_fixups =3D {
> +       .late_init =3D mx25l3255e_late_init_fixups,
> +};
> +
>  static const struct flash_info macronix_nor_parts[] =3D {
>         {
>                 .id =3D SNOR_ID(0xc2, 0x20, 0x10),
> @@ -199,6 +228,7 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>         }, {
>                 /* MX25L3255E */
>                 .id =3D SNOR_ID(0xc2, 0x9e, 0x16),
> +               .fixups =3D &mx25l3255e_fixups,
>         },
>         /*
>          * This spares us of adding new flash entries for flashes that ca=
n be
> --
> 2.25.1
>
