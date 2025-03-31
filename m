Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6271D5173
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407489; cv=none; b=MYCyvq7U0RI7NrFHRDKsbEo36Fe4k90cCNoMddwwrftaHevR5BbV3Fmn0TlHHOqNb/Ibx7HO6MH2aS2/HVar3/yCKMCmTksI3nERWR7uZYbJIA+AvX05u9keFwlHCXDDQY6N4/VYQTaJAcbiRJrIg6OQQvAqt/JS1LPjSFzyo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407489; c=relaxed/simple;
	bh=Ja2b5BajyZQJVleOMApddlyPJUBUox5qq00mF76Nxss=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NK68+2pQRiLqNzEmWy7mhybGR+Le40tzsJDo2oRSaYPUvEc9DrKBs+ErVCDChyS9ulDMS2c/oaqvA8FxcnFWCLntzOxubps2urefS2B9mmM+secGlkRfR/6FK8H6w1GyMrYvL9xD5KQTSDzlMluxZc6HlvcKxh687a9lajLkv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3h7SVdy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3h7SVdy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso802344a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743407487; x=1744012287; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AiOU8eMQlOYP7P+e8X+mdPFIr3VBEpQEAdsGq1MvY7Y=;
        b=l3h7SVdyPgG9rO59FnDR0fykn66Zib9jRgAOaByzoLXQ7uZT740chvboukhWLtkDlU
         KDUSJPHxvOgInXO/6IgzPtdgW3DDl0nklOYZ+vV9IH1egDzGAL6U2/o+3R3FNseOoPNO
         vcH3srjLgu7huRgH6HMB7MODyKWqxQNH3AWHLFQ2QSfCVtl5I0h7safoLIVeTbW7VY+h
         YoU6BOkeAuVdCR0by65G7JksByHcleNvX+kLt+F0Ev0xQpU0TUwhXKPsc1wu03CV26va
         m/P3J+HxG/yyqqtLOMAW/ySVqvRT7+d/ZSR0pLeOaQ86RfSySgN6Yus6set2cs27XI4I
         JBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407487; x=1744012287;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiOU8eMQlOYP7P+e8X+mdPFIr3VBEpQEAdsGq1MvY7Y=;
        b=f1GOzw9J8VT9bOKpNaWr1Pzx4WKhpma14AQJK0t6JECvZxJEIPDJ0OD4OVtCOzBS8l
         LNnoi7twi4ajp8jzRX3k2P1sNegqUDMYwWHpG4OG2Nqxbc72RexKTXxYsTUJ/Kt4CkUT
         z09bifWYBeDvYGvfWUrkvqYQ2FP7PEFk992TKatSAdnnZMvVxpaQugRjeBgJ0aqvHLup
         QTXRWADZXOcuh/ykbqITTCHyqXOeA/aWCyWEuYnM7bbjr5QGdsb515dONIge4NO+IPHL
         oN5VLP/1s4N8BJAOMTh1uiLzY3+HUKoUrkdjVZLkEIt0hIOkETr4r4Uzbwnzl9ezsRM3
         MD2A==
X-Gm-Message-State: AOJu0YweU/FozFWIeaeo1Iusv7/DmqSMWA9dzgB8Qcm8HToh5/yn3/0O
	iCwRkj/Edf86zmTGKFfStQXDh6r7NVLL4vauMX7DetzF6vFMPziB1NYToCvhYj2KytQ7DnGV8xi
	nKJ126szICmUOec6FZz5ClMkMhM00bYlF
X-Gm-Gg: ASbGncsDBFiHiCjYyCT9BEmxK7415BxFnl7Rt2TsyEn63RhLZjYge1vAJco21u2U0wF
	Trw19jLr+OuiE0hLrwp6KiBEdLLsUxNNGbBPE3ygb68bXNAJXcNVRQt0s/SmzZKzO3pqFTe98sb
	y4pRQ7sxDySjdNuSjak//WmqSibg==
X-Google-Smtp-Source: AGHT+IFc018RGrEcu7xhxTWYiMjoc1T3oUgVceAmKA8d0tTO/UO6VlSFg1ykiSlt60CO/9odhtwsfDir9DiK5RekElY=
X-Received: by 2002:a17:90b:3b85:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-30531f715a7mr4966006a91.2.1743407486919; Mon, 31 Mar 2025
 00:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Mon, 31 Mar 2025 15:51:16 +0800
X-Gm-Features: AQ5f1JoKfbSkGLbUAUgP2FCD9RDBLbvBEr_9LwYKOZEfeMQ3iqNtZXogp647Xjo
Message-ID: <CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>
Subject: platform/x86: thinkpad_acpi causing kernel oops commit 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
To: lkml <linux-kernel@vger.kernel.org>, Kurt Borja <kuurtb@gmail.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This commit prevents the latest linux git from booting. Only those
with thinkpad-acpi will see this.
There's no clean way to revert this. I took the thinkpad_acpi.c from
vanilla 6.14.0 and that booted up with the latest linux git
(4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209).




commit 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
Author: Kurt Borja <kuurtb@gmail.com>
Date:   Fri Feb 14 19:03:01 2025 -0500

    platform/x86: thinkpad_acpi: Move subdriver initialization to
tpacpi_pdriver's probe.

    It was reported that if subdrivers assigned devres resources inside
    ibm_init_struct's .init callbacks, driver binding would fail with the
    following error message:

            platform thinkpad_acpi: Resources present before probing

    Let the driver core manage the lifetimes of the subdrivers and children
    devices, by initializing them inside tpacpi_driver's .probe callback.
    This is appropriate because these subdrivers usually expose sysfs group=
s
    and the driver core manages this automatically to avoid races.

    One immediate benefit of this, is that we are now able to use devres
    inside .init subdriver callbacks.

    platform_create_bundle is specifically used because it makes the
    driver's probe type synchronous and returns an ERR_PTR if attachment
    failed.

    Additionally, to make error handling simpler, allocate the input device
    using devm_input_allocate_device().

    Reported-by: Mark Pearson <mpearson-lenovo@squebb.ca>
    Closes: https://lore.kernel.org/platform-driver-x86/20250208091438.5972=
-1-mpearson-lenovo@squebb.ca/#t
    Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
    Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
    Signed-off-by: Kurt Borja <kuurtb@gmail.com>
    Link: https://lore.kernel.org/r/20250215000302.19753-2-kuurtb@gmail.com
    Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>



My best.,
Jeff
