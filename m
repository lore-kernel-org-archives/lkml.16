Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D06F2F2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636821; cv=none; b=d3giuI36dLGg7rl7uvIlwJZYG6KIhEXTbgP1yR7VG9k2UQ8WwLhaDZR4ZiFl1FRAPbVN6sCiEELihtId52Ff7XPlNKzFnCGlSsJRTwREApQqojpyF8t+/BlcvHix7Q8+iccIAowZ+KnPhCiwNvK99Q2YVyYAWm6m9/Munc4P5cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636821; c=relaxed/simple;
	bh=kPFEp+DgFgPN5/Q8vbl7679/mZEZ8m7Gi2RB1XraLNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JL146eWmZ1oZBRsjz1dcgjIUW3UcfdZBuMYJvAhXoHHCOAd51ij+o5+OLSkcwZTPkDQfJDzaQiVGse+pzlhBBJzeJXktrMEPwcBuvgSwRd7dE3DoLX92wJX8X7AjWxMd7SZa8UC4FTur4N/Alqvb6uTpWajjLkJStzEhnThE69s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=le/9UpZX; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="le/9UpZX"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e844a062c80so434115276.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750636818; x=1751241618; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsUqh5KfGmtfMMkvC2Jq3US5g0bcIW06yFVOpYy+eOo=;
        b=le/9UpZXNpmhO5km/GmZWZ2crBoKYQ+1+2UnuBQ6tOagrnZEnFrX50P4aQEVBtX1Wj
         3+HTzDgWjQuIFtt0mEHFPpLDKRtEsF8jb/XN0t3+HYxDCeI1N3TPTiSgDw7xW69bnDjK
         MLkuIzeZcjLdj2p3/mnkGPc8CuBpB9lXLlBXYqt2nd5EeplnXcF8z0WDj51yno6wncN2
         0wVSVo0gi27Sdi6vyqX6qLu7rH89E0ScMcNhRiMzaC19xJA7sN0P/HiCWGvaOz1gboDh
         8tjX5wSLYAOjnjZnUA1oxZjZWFdAmx7x1scPOhzeEhotYF/spwkkZO7CUJFW/lb4RlYf
         Mb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636818; x=1751241618;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsUqh5KfGmtfMMkvC2Jq3US5g0bcIW06yFVOpYy+eOo=;
        b=m7ah2bRFQojgiejP2c92j0wzf/XeRIwqzAZ/y9xEUSz0/anpN7+7KkU4W26BlvXra4
         qOqMvZmk5xliQR4B3xwuc0meXDAZlk3aH5nwpqRGjqJNEoWlCQ1P8je/UIhzn2I2WaHn
         SPAW+9jnI6OSrhcZhLDTHgmgWeID2yYuYi5MvE28+R3c3ZX+xayELSZM+SeaMQmuVdBy
         JVejGWlBQa15YRR9vtIAnxaErykpnriQlK/NEbaQM1I+zTs/Soo9WHwJqAuX4lIuE4bD
         oV9rFHBjhnKim9uSZlG4r0e241GGzZD+v3J3qihLQKXp2CPVxg5WUnQ38qKOZH7ley7L
         QAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlpMJqhb7Nnsfrt/TvDXRN3YCnWvutCV67wS6ZVDM9uAa8kIKr4t9plW37loLDzHPZBjI+HqE9D1lTugs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuh38KtfV8k3bFASHAnJU2x3sxF2gPqLgR7vCrcZUKf/So2DjS
	1ShdnpgJGoZwrPYoFYSKFDu8zqVv/WcQr5Y037F2gKmS0Gk2oN/NnE0wyYguQFpN+A==
X-Gm-Gg: ASbGncuFkFrM13uJQ2ZLf1GxA7B/oI7NxXjq9Jno3oQJW992tehFPdWPI2kDSNzyEFV
	3vDgHGNxu3Z+MkSNelXL3YO6FKYE64Q4J0GcAKfNZzZtiJbo7GGWJxA+aHVKUQqryLUSB9hW9bw
	msa/Pw482TE2RZk6VfcUv2TnS+MEfnXVfSwPtu/q/Qe/txhWJ/3+XmJgRgCngaBuFqcVtD7ovWV
	HUcAewx9EEDZ8Du5el5V8AoGuF7soYtmvgBgOk5wCSc6TVXZTPWAv89+yMdewHvz0V5LTujuzim
	DZ4CuXhXJtWcvaxW+yFRv0xmW/8Tm/z/e9iSFQ1QF9pORbl4x85p0lFGiyjQS0r+tQaoNWxJ+YY
	wGLDvnqORC+mmjsuHMGdTD2RJueHeXlS47nnUlIFDTCjXAwo=
X-Google-Smtp-Source: AGHT+IFSPg2FJgymL+0Ql0jhxbj7TlYr+9kn3/WtUrsZejd/BQVFr3O4trGSNIfGmN2s9p2p6qN6DA==
X-Received: by 2002:a05:6902:2ec4:b0:e84:49d8:77c with SMTP id 3f1490d57ef6-e8449d80fe2mr3228632276.28.1750636818028;
        Sun, 22 Jun 2025 17:00:18 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ab0a7d9sm2139664276.24.2025.06.22.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:16 -0700 (PDT)
Date: Sun, 22 Jun 2025 17:00:04 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Damian Tometzki <damian@riscv-rocks.de>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    miriam.rachel.korenblit@intel.com, linux-wireless@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: wlwifi AX201: WARN_ON in iwl_mvm_mld_mac_ctxt_cmd_common repeated
 UMAC FW crashes on 6.16-rc2
In-Reply-To: <CAL=B37mqrHOzEQzPX3=6S5XaUZexYRUXNBgUuGsiX6+4iHWO8g@mail.gmail.com>
Message-ID: <e179da27-feb6-36fe-0a3b-bc24fb00b62d@google.com>
References: <aFgvmhSbup2BnUHu@fedora> <CAL=B37mqrHOzEQzPX3=6S5XaUZexYRUXNBgUuGsiX6+4iHWO8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-1164435157-1750636816=:2472"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-1164435157-1750636816=:2472
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 22 Jun 2025, Damian Tometzki wrote:
> On Sun, Jun 22, 2025 at 6:30=E2=80=AFPM Damian Tometzki <damian@riscv-roc=
ks.de> wrote:
> >
> > Hi Miri,
> > Hi all,
> >
> > with v6.16-rc2 I consistently hit a Wi-Fi firmware crash on a
> > Lenovo ThinkPad X1 Carbon Gen 9.
> >
> > Hardware / FW
> > -------------
> >  * NIC  : Intel Wi-Fi 6 AX201 160 MHz (PCI ID a0f0:0070, rev 0x351)
> >  * FW   : 77.864baa2e.0 QuZ-a0-hr-b0-77.ucode (auto-loaded)
> >  * BIOS : N32ET96W (1.72)
> >  * Platform: 20XWCTO1WW
> >
> > Kernel: 6.16.0-rc2 #440 PREEMPT(lazy)
> >
> > Symptoms
> > --------
> > Immediately after NetworkManager (or plain `ip link set wlp0s20f3 up`)
> > the driver warns:
> >
> >     WARNING at drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:37
> >     iwl_mvm_mld_mac_ctxt_cmd_common+0x175/0x1d0
> >
> > The firmware then aborts:
> >
> >     FW error in SYNC CMD MAC_CONFIG_CMD
> >     NMI_INTERRUPT_UMAC_FATAL
> >     ADVANCED_SYSASSERT 0x20103126
> >     Microcode SW error detected. Restarting 0x0.
> >
> > The cycle repeats every few seconds; the interface never becomes usable=
=2E
> > Full dmesg attached.
> >
> > --
> > VG
> > Demian Tometzki
>=20
> Hi together,
>=20
> I identified commit 83f3ac2848b46e3e5af5d06b5f176c as the cause of the is=
sue.
> After reverting it, the system is working again.
>=20
> Best regards
> Damian

I have a similar Lenovo X1 Carbon Gen 9: saw no problem on rc1 or rc2,
but vey much this problem on today's 6.16-rc3.

Patch from Miri's reply (attachment without context so I'm replying
to this not that) inlined below, works nicely for me: thank you.
I've removed Change-Id and Organization tags.

Hugh

From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Date: Sun, 22 Jun 2025 23:42:04 +0300
Subject: [PATCH] wifi: iwlwifi: mvm: assume '1' as the default mac_config_c=
md
 version

Unfortunately, FWs of some devices don't have the version of the
iwl_mac_config_cmd defined in the TLVs. We send 0 as the 'def argument
to  iwl_fw_lookup_cmd_ver, so for such FWs, the return value will be 0,
leading to a warning, and to not sending the command.

Fix this by assuming that the default version is 1.

Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c b/drivers/net=
/wireless/intel/iwlwifi/mvm/mld-mac.c
index 3c255ae916c8..48ab6a2a98cc 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c
@@ -32,7 +32,7 @@ static void iwl_mvm_mld_mac_ctxt_cmd_common(struct iwl_mv=
m *mvm,
 =09unsigned int link_id;
 =09int cmd_ver =3D iwl_fw_lookup_cmd_ver(mvm->fw,
 =09=09=09=09=09    WIDE_ID(MAC_CONF_GROUP,
-=09=09=09=09=09=09    MAC_CONFIG_CMD), 0);
+=09=09=09=09=09=09    MAC_CONFIG_CMD), 1);
=20
 =09if (WARN_ON(cmd_ver < 1 || cmd_ver > 3))
 =09=09return;
--=20
2.34.1
---1463770367-1164435157-1750636816=:2472--
