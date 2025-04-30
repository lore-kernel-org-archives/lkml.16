Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF82DC78E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003009; cv=none; b=I5q7OaTmcJKXX/OMHXY+9waedQ35qed0LCGssWO+IACjD5Yyxyy/vuqAX8tb/hkog+ys62oG2nr+31JO2yOqPNn1fxEsDxNzU9KF3j3Tp35xVtZAlLw1PWW1vaEKqUm9qYMJDO95ZNKrENtH3PQ0jq55GUaqGFUj9h7k9EInhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003009; c=relaxed/simple;
	bh=KNpuHzwTaaTYpf7LfrnyBa2FI4gDtfLAyiquhlf2Pro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQguTnK7rjG76s+5Vx2jhcgMbWztPBVuEpFNXUjVcOUUrWSo6HYG+6jOmNdOovEH399JBp9+6Q5hKalTO2WjGwnpHloJcia9dYiWjG82T+qPG5eMcGZ06Jf717zGNa9XL7O/FcrFjZ3OdV8WtBl20YcMEBUeEIfOPFuM9S99npM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=mgfhyMeG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="mgfhyMeG"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acacb8743a7so124753666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1746003003; x=1746607803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1qs81RVT7WGaI5EEDOkNWrLzSI42G5tmDul/p84+M0=;
        b=mgfhyMeG7AC9qUCK+iducS3K5ToALUjsIljt/6NKaP+fFtcBuT56BQIyUZv4bOjlBd
         EnwDy05tcCX3QIRZ/zPMp3LKOqF0P+VGgwkPn4rHvZSOVJUXN9xzFQDVTR2B+wHLeQDN
         PKOW43qr9lqPxSxl8f3Hvw+yT4vXLKFgU5JlJ4LlzVjExDLKXN0eGqlzWG4ZP5iZSzTf
         LfqqPCbGrg+stWxpuxuuHmDLL/CaKo+QGx6oxy3+oY8xV1VvGP9ebB3Pebp4lIAjgBfx
         CPWAtk1/8OTN199fHgVjUBIDf0JVur5X9ZkhkKoGpuGmp0DQF3zIa0O+VfKWeZwsZQO0
         7/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003003; x=1746607803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1qs81RVT7WGaI5EEDOkNWrLzSI42G5tmDul/p84+M0=;
        b=f2RKTzzP+NOw8w/XIVT7KW/3TzGiJIZcdNTamH4iGfmZPr86VMrq2A9RlV1he/AqFd
         5IcbjnZJbifEec7dPZK3Z9T9UabJWfUfEICTYjlCDUNdL/cExUmNOvYgZM49nulTo9qt
         z8SMrbomRxuzcxnLJWmVlWuwplUkhRxvGZuSphkOksoJpr6dOD2jxRkCE4LzLV9zNBDN
         vASl51rmvqztfu/sQ25pKdIU2teVQnmqp1u0cPGWTo9/k/6V3ovxqoKJfb9wskyg7wqU
         DD7gSql/+4sP+zszRNwJiu100vlUW3SeZriVz+fjDDFAkfU7fER2WQRm/hdfmpfOD8Ft
         Bedw==
X-Forwarded-Encrypted: i=1; AJvYcCUh6I7vZEW4l0rCd89ajfhXzn+6Zp1Dp06iqrAsDI/kWX6Mv4WkHu2iJIlbscgspeDdWvHexXPnILiuBpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOICjsRvemWwswiftMEmzA2GqclJJ7vsjEWcj736PExPirzHua
	WSYbOct86Rj70A/Pp3PAa1kWLLiyNHLHKHG5sVL8dQi5B28kcsJ0UNrIHBHkVvWuJ1Rf2SUAvTA
	H+ouloYiF86iQ/dUbqT03L7jfMVQQen3INZCqdgPDq0aq1hB4wjucHprt
X-Gm-Gg: ASbGncu5FdaPK+XES33PgsrsTMzRY85PqfPYulkXDBB47mCIJ2hqP4gU/4UVqNG4IAT
	nqE5wO9/YrIoFyQnLnr+bq5MTD+4tMudkQ8US3s/E8+A1TPfBYTiShVYMtYOyu6S+IrBN78KXRQ
	C38wgay+rOaG8KJ2x8BDAZ4NXePwWGGIo1igpr
X-Google-Smtp-Source: AGHT+IEj2xNmii2aVrB0HPnZcj1cS2DilF+s1D1CmUyT4TXXlXak86RbcnaZ+lF+p2b/bE6q5sm0vkwf9XHDx/ezzxg=
X-Received: by 2002:a2e:a808:0:b0:30b:a100:7fec with SMTP id
 38308e7fff4ca-31e7d4d6977mr5091471fa.12.1746002599538; Wed, 30 Apr 2025
 01:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPXr0uxh0c_2b2-zJF=N8T6DfccfyvOQRX0X0VO24dS7YsxzzQ@mail.gmail.com>
 <aBHgOsqA4qfe7LbN@c757f733ca9e>
In-Reply-To: <aBHgOsqA4qfe7LbN@c757f733ca9e>
From: Ezra Khuzadi <ekhuzadi@uci.edu>
Date: Wed, 30 Apr 2025 01:43:08 -0700
X-Gm-Features: ATxdqUFr52ls8iRfGl3SJa_g3FJ8AF-6Py3XE-3yWU18Haruwxmc1FYYj3yD3U4
Message-ID: <CAPXr0uxJg0kMu_N7Gxb14kVdhkFGXO_KbK5RxfAcY9dEA8vrEA@mail.gmail.com>
Subject: Re: sound/pci/hda: add quirk for HP Spectre x360 15-eb0xxx
To: kernel test robot <lkp@intel.com>, sound-dev@vger.kernel.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	alsa-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sound/pci/hda/patch_realtek.c: add quirk for HP Spectre x360 15-eb0xxx

Add subsystem ID 0x86e5 for HP Spectre x360 15-eb0xxx so that
ALC285_FIXUP_HP_SPECTRE_X360_EB1 (GPIO amp-enable, mic-mute LED and
pinconfigs) is applied.

Tested on HP Spectre x360 15-eb0043dx (Vendor 0x10ec0285, Subsys 0x103c86e5=
)
with legacy HDA driver and hda-verb toggles:

  $ cat /proc/asound/card0/codec#0 \
      | sed -n -e '1,5p;/Vendor Id:/p;/Subsystem Id:/p'
  Codec: Realtek ALC285
  Vendor Id: 0x10ec0285
  Subsystem Id: 0x103c86e5

  $ dmesg | grep -i realtek
  [    5.828728] snd_hda_codec_realtek ehdaudio0D0: ALC285: picked fixup
        for PCI SSID 103c:86e5

Signed-off-by: Ezra Khuzadi <ekhuzadi@uci.edu>
Cc: stable@vger.kernel.org

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 877137cb09ac..82ad105e7fa9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10563,6 +10563,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
   SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPI=
O),
+  SND_PCI_QUIRK(0x103c, 0x86e5, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86f9, "HP Spectre x360 13-aw0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED),

On Wed, Apr 30, 2025 at 1:33=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://urldefense.com/v3/__https://www.kernel.org/=
doc/html/latest/process/stable-kernel-rules.html*option-1__;Iw!!CzAuKJ42Guq=
uVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc5uEQDwV-Q9=
TeKK7R4THFV7fXQ$
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to ha=
ve the patch automatically included in the stable tree.
> Subject: sound/pci/hda: add quirk for HP Spectre x360 15-eb0xxx
> Link: https://urldefense.com/v3/__https://lore.kernel.org/stable/CAPXr0ux=
h0c_2b2-zJF*3DN8T6DfccfyvOQRX0X0VO24dS7YsxzzQ*40mail.gmail.com__;JSU!!CzAuK=
J42GuquVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc5uEQ=
DwV-Q9TeKK7R4SyRLIbeQ$
>
> --
> 0-DAY CI Kernel Test Service
> https://urldefense.com/v3/__https://github.com/intel/lkp-tests/wiki__;!!C=
zAuKJ42GuquVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc=
5uEQDwV-Q9TeKK7R4QdTQyPmg$
>
>
>
