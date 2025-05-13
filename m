Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188C155382
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747098712; cv=none; b=EbwljSsUw/tyUqbang7XW3dxsItIqGyQIKTeNuHIEeXsriR3/KlVy4w+EIq9z0m8Yxi6xeien/YokFEaiTgx6VTYa4VE9u8RVOjJtXBNWyVHkbfpANoMElRtixKgtMpPQsqtAhOWuN7w16WnBJg5gE2f2EI827w0vNiZIklubcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747098712; c=relaxed/simple;
	bh=11sC5CL7ALkDxBRJnk00zA9FuQFKn2BigmhwdJiY6NQ=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=S0AqqC6ryeUa7axM93u5G7bBk/yAskoBqkuZP+t0sxbIl4X3XF2MucjnjSQOFVzKcqBH7Up6h71cTNpAuSgprCVWUI343uNA7ag6mV8Rfru31tn9H+9eWvss5Z+FZqr3aLqYij7hQVSPFzZUnbwaxakdd+n+/5XGuZydWHaK6KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r4wTNkeG; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r4wTNkeG"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250513011146epoutp04986808a3878438bc69de5db112d5929f~_8QRaJtmy0202802028epoutp04u
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:11:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250513011146epoutp04986808a3878438bc69de5db112d5929f~_8QRaJtmy0202802028epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747098706;
	bh=11sC5CL7ALkDxBRJnk00zA9FuQFKn2BigmhwdJiY6NQ=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=r4wTNkeGRIWgHXyaV8eJyYeARVG6964apqUZq0yZhcPLmNmyJgSrb0PP6LD7Bi3/j
	 KzcmyCd9fMIKWSySB2zV783lBx0z4aqa/znLYsGqLL02kAtB6IsMh6OTKKTu2UG4Si
	 xkS2HqO0cwQhbl7Plia9Hn3hxhXmcKzvR4mx7xnE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250513011145epcas5p4c7cd0f22a7a1f8abca2941c8d5906dc0~_8QQ8r-S90223702237epcas5p48;
	Tue, 13 May 2025 01:11:45 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZxJN16fWQz6B9mB; Tue, 13 May
	2025 01:11:45 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v2] drm/edid: fixed the bug that hdr metadata was not
 cleared
Reply-To: feijuan.li@samsung.com
Sender: Feijuan Li <feijuan.li@samsung.com>
From: Feijuan Li <feijuan.li@samsung.com>
To: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Hongfei Tang <hongfei.tang@samsung.com>, Minggui Yan
	<minggui.yan@samsung.com>, Qilin Wang <qilin.wang@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016@epcms5p8>
Date: Tue, 13 May 2025 09:11:45 +0800
X-CMS-MailID: 20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p8>

Dear maintainer:

I have changed the patch as your suggestion.
v1->v2:make a new function for hdr info reset.


From: =22feijuan.li=22 <feijuan.li=40samsung.com>
Date: Fri, 18 Apr 2025 14:56:49 +0000
Subject: =5BPATCH v2=5D drm/edid: fixed the bug that hdr metadata was not r=
eset

When DP connected to a device with HDR capability,
the hdr structure was filled.Then connected to another
sink device without hdr capability, but the hdr info
still exist.

Signed-off-by: feijuan.li <feijuan.li=40samsung.com>
---
=C2=A0drivers/gpu/drm/drm_edid.c=206=20++++++=0D=0A=C2=A01=20file=20changed=
,=206=20insertions(+)=0D=0A=0D=0Adiff=20--git=20a/drivers/gpu/drm/drm_edid.=
c=20b/drivers/gpu/drm/drm_edid.c=0D=0Aindex=2013bc4c290b17..cd0e4148f6b0=20=
100644=0D=0A---=20a/drivers/gpu/drm/drm_edid.c=0D=0A+++=20b/drivers/gpu/drm=
/drm_edid.c=0D=0A=40=40=20-6576,6=20+6576,11=20=40=40=20static=20void=20drm=
_update_mso(struct=20drm_connector=20*connector,=0D=0A=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0displayid_iter_end(&iter);=0D=0A=C2=A0=7D=0D=0A=C2=A0=
=0D=0A+static=20void=20drm_reset_hdr_sink_metadata(struct=20drm_connector=
=20*connector)=0D=0A+=7B=0D=0A+=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20memset(&=
connector->hdr_sink_metadata,=200,=20sizeof(connector->hdr_sink_metadata));=
=0D=0A+=7D=0D=0A+=0D=0A=C2=A0/*=20A=20connector=20has=20no=20EDID=20informa=
tion,=20so=20we've=20got=20no=20EDID=20to=20compute=20quirks=20from.=20Rese=
t=0D=0A=C2=A0=20*=20all=20of=20the=20values=20which=20would=20have=20been=
=20set=20from=20EDID=0D=0A=C2=A0=20*/=0D=0A=40=40=20-6651,6=20+6656,7=20=40=
=40=20static=20void=20update_display_info(struct=20drm_connector=20*connect=
or,=0D=0A=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0struct=20drm_display_inf=
o=20*info=20=3D=20&connector->display_info;=0D=0A=C2=A0=20=C2=A0=20=C2=A0=
=20=C2=A0=20=C2=A0const=20struct=20edid=20*edid;=0D=0A=C2=A0=0D=0A+=C2=A0=
=20=C2=A0=20=C2=A0=20=C2=A0=20drm_reset_hdr_sink_metadata(connector);=0D=0A=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0drm_reset_display_info(connector)=
;=0D=0A=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0clear_eld(connector);=0D=
=0A=C2=A0=0D=0A--=C2=A0=0D=0A2.25.1=0D=0A=0D=0A
