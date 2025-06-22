Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6345C1E86E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750633098; cv=none; b=lR/1QMULzCgbabfzhswpfClNscVZBxEm59dssyWYuKOZXzXa4iL2ljjBt8EJ5mxkUxiIeQk6O8YrEvFAWpBSlL6ls6OyBEoKiEXHFLiNJsY7QUVeReRFL9sjlXb1gK4rGAMGmHhE/mzjHYWgLDuoMIpbBYyrANwTVSgEnR8s7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750633098; c=relaxed/simple;
	bh=FXgCVQg29xOjyufmDx2h3U4xzkRyePHzuqYijSCrFKk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WXVD+SAPKmt1LbyZDg0ZBdfAdsANhQLSQC+nPDq+ZHiFpASAHpHDdJ6DbEkszkSv5KBLuPtBkhbRu7NrKRHiV9nCNswUZHTm957t4Hrhm5wLqu71aVm4uXj9jxjEvys9VS8pa7E7RA2sh8t7EP9LJUeb+sVV1BdLNUWg+8y+JNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FUTiJ206; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FUTiJ206"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750633087; x=1750892287;
	bh=FXgCVQg29xOjyufmDx2h3U4xzkRyePHzuqYijSCrFKk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FUTiJ206dDlEqFwmj3QoCEUKArZFq0mtMfcDE0uQR1bQqBhxdd+oTMBDYiTjc6i2X
	 pe/afTntg55zoqjdoUAOvByxxpJUXajCLwBqRPteJimzli1QNahQqFzVBLTjCmXyGO
	 cD+8+5EYaj26+NKd1OJBPNwBrDhp0htfIXFsa4OAxrKlPi1LzQ5RVKOhwbDsf7O9b4
	 xPVOKi+BQNSRVWTUVH0GPbTwte/qFdtMTKMQZHIu27vGZKku+dYipdu6dyjs2rcPvW
	 TKArklvUCC6QwgfhO3NUroAKajJ6j4KEq0OHVG2tZsLh8qBlb5jOAJ1QBCbRzKZ4DS
	 mdd4i0Vwplsrg==
Date: Sun, 22 Jun 2025 22:58:00 +0000
To: broonie@kernel.org
From: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Yuzuru10 <yuzuru_10@proton.me>
Subject: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
Message-ID: <20250622225754.20856-1-yuzuru_10@proton.me>
Feedback-ID: 69774799:user:proton
X-Pm-Message-ID: e9c87519a1144c14e2af0cfc88eb17c421809c90
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
allowing the internal microphone to be detected correctly on
machines with "RB" as board vendor.

Signed-off-by: Yuzuru <yuzuru_10@proton.me>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 98022e5fd428..499f9f7c76ee 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
 =09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "83Q3"),
 =09=09}
 =09},
+=09{
+=09=09.driver_data =3D &acp6x_card,
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
+=09=09}
+=09},
 =09{
 =09=09.driver_data =3D &acp6x_card,
 =09=09.matches =3D {
--=20
2.50.0


