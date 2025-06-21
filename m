Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB6216E23
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750528963; cv=none; b=myWFbpcfNoQilEyXNUE1ez9z3NVNdZaiTKp3fOVaq/J20GkxubTFAOec9D4daME0WhsX4J6Kyq+0HdTbeKza9N6WgSR3FzAMjIF2Otw65MkJbd1zq0SBzqH5zmS0BRCpHj49qjsW4cl1Ll17oKlugVbl60AEYzfSjRtaxk1DbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750528963; c=relaxed/simple;
	bh=U1t7u8l2/hiXO8Wzq2xYh/3s2sZDhAvFEnY4rfcPWyA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U0ycZcUkcMJDSX/ZE9jcwD6FdJuXe9TZmMDsUz0pEnZPtoZQ40myeWEpQhBR7LP8JSSeZ9CAXI7xu3gu+FvcYhfGH+QzK6WHBdsJ07vw7mi6VRUDKVOVlAeF2MPo2aCgB4w1X/5UID0JPsh7jx6uHGEZMIGO0WNFHG7fFnQZhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hiPNNJqb; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hiPNNJqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750528951; x=1750788151;
	bh=U1t7u8l2/hiXO8Wzq2xYh/3s2sZDhAvFEnY4rfcPWyA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hiPNNJqbazqpKySnh8Nf+HJgKT+wW1E6DivuujtjwDHd6SLQC9PnGCVZQZOWkiQpa
	 lMey8cTICzRS3o7SsvMcTmigL0H9vtvotuamLex6kmfnfoOn6QerKT0LXxxNoijD+E
	 RSW7k6judvZag8ugDmCQSXCmsGfnsx40A2LzKFwge2/QOj+QvQgvsq5SCTs/Fa4015
	 CTlXMvJbao9gmqzwG9Ph6aI8dJhhKzpCYKjrrLSxsgaZt1XkEYGveYx1/bB4724k2T
	 N5GFWPPk8IvWZKbcjSuCKlDncXQ4XKPjk8EYCDq4KjVFi9RHbpJzt2+TCue4WTlnyh
	 NG/Il6iBoIezA==
Date: Sat, 21 Jun 2025 18:02:28 +0000
To: broonie@kernel.org
From: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Yuzuru10 <yuzuru_10@proton.me>
Subject: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
Message-ID: <20250621180223.14677-1-yuzuru_10@proton.me>
Feedback-ID: 69774799:user:proton
X-Pm-Message-ID: 157dc826bff55585d992db26d48cf200b97aea7b
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


