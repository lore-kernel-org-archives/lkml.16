Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB618DF80
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746307163; cv=none; b=BLYz1pjYC0e1b3AbL8f+NqDJ22w9eJ4uM4gSDa8PW6UpsFti8EWTSiOssyuJJWxxGEPuSvyG7Tg21W//ovJza/7wEfMtZeFpAzXiWWI2/AujHk+INqXCKxsr2vNEQgdRSwQ6WXRdHiC7txO9+fvlitKVE6muF9KmN7pW+TIWhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746307163; c=relaxed/simple;
	bh=bjW2Ozk+ryipDf/oBirPv588cK3svv0YSxm0DRoMwmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gCpbfGFLHOuwTLT6fqceZIXNsC2DZG65wLR+GyFExIWQBEe9hRXV2ewPMdHM3IVHXAuNlwxt6/N3T9QFyhrVjRKFqy1LVAddnEro53Cj4YLjPoMDQORf70CSXPbISm1DDWCfJayId7RYT7MnIWlvFWan4JiL6+uaH0A8t2cUSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=UpORUabr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=noE3qTIf; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="UpORUabr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="noE3qTIf"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 26924254013E;
	Sat,  3 May 2025 17:19:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 03 May 2025 17:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1746307159; x=1746393559; bh=Un/bt6UrGtVYI4PFhsLl7
	CgrGuxCoSHY1s4qLoGbllQ=; b=UpORUabrLd8cN76Jaq6K2gkqwM7By3HBukQma
	oUYNv0zXHW7u1PBaHzM7HW5affDXjNZ6QxE9keHf3gIm8NH6qgOL9SDjyMWEaLmp
	DX4ZwEu064lFTe0tzfIvhlf6z6A+oza0qbmWRUlVXRyhgXQYu5cuQf1JBnwoWeAj
	br+/0Xw5ccuojAyfUM0UAbPJ9lBhHxF2BeFGiAz5neZ/7F+9cMaUc4TW5aw1mOKW
	UUALRcAuacdYt5NWiNGFgdMiqtDbtGx7Z4NAlsEku7p6/u/FQEARs1Ph7vILrU4M
	PtH8XOVHSEX176ZtdQLQjrK/nA+WMFZuc8j8ITV3PsugRLsdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746307159; x=1746393559; bh=Un/bt6UrGtVYI4PFhsLl7CgrGuxCoSHY1s4
	qLoGbllQ=; b=noE3qTIfgRvJF1xbUDmZjlGPJqUtmlmmzmNHLBHNmKeseXZUH99
	MhnejinCiEDwlQGxPa4qlDqYHKrUA0UofCwvHMRMLOw3isU0NbLSHAA2qZJ9mc9C
	9Oxu+uZB8RTi1ucJJ+2VLtFf5Vu+DPI+TzagPShBeYonJ+tTVmdS59jq92190p4w
	3IaYsaObLcT9m65qyGCCiAqnBDCXE9osT5V8mCI6sNjb8pFu3H08/hPtWqxPX/4r
	gyMF4sJJgblnP+yfl1S1FV2pdGHB++60UqGGbohd2AGqufg51HA4RNFAnHHfgIv/
	h6IZbJYvanDUz0+yY38Xwn/flEc4+ACLqgw==
X-ME-Sender: <xms:VogWaMuH_f-vO3iJMZCF0uUZlGFNoJi-rDgUdE_2klNulzM8XkZJfw>
    <xme:VogWaJdPDUhJkqOu_SPXr92ZC2z0BApsMm_PUKDHSYwij04eAfx9lbAOiu5UqMFhi
    bx-5OJNsu3K3LmCoPI>
X-ME-Received: <xmr:VogWaHzlwOtLlAxTcG6J8wE3FZOYiyPgHK_CGYXnrQ5qjJnW6jjN0JdDiQLNPRffUiFp9cwTwqt5q4mOA69jlx9Ev2VNDRET9Y-tFFLbhcxsY1pU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeeifeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflrghmvghsucfhlhhofigvrhhs
    uceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefhvefgkeeiuddtudfhgefgiedvuefhhedtffejtddtfeekieefieejveet
    hfegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthht
    ohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhrghrrhihrdifvghnth
    hlrghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdr
    tghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpth
    htoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthho
    pegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegrih
    hrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhl
    rdgthhdprhgtphhtthhopegrlhhvihhnrdhlvggvvdesrghmugdrtghomhdprhgtphhtth
    hopeiirggvvghmrdhmohhhrghmvggusegrmhgurdgtohhm
X-ME-Proxy: <xmx:VogWaPOJggpnPRy39gdK-KmQ1lH-vrPZCA_Q0myv6HK8vhG5tK-81A>
    <xmx:VogWaM_SzOP117tFfJ1ArzIaxdsWp-Qh2InRVKwDbzeCXsFPfu0f3g>
    <xmx:VogWaHVYVl2__DEJXwZ2AEln8aPqwAFiM1PP73GXA09lopxGJB8xQA>
    <xmx:VogWaFdZtsW59lP3kU3fTGc8PQpvp4HSy31odCNxts-iQA4ENVwTiQ>
    <xmx:VogWaKrZt3rFDrJvHAiEGqVBDy7aqY01UZpTRjDteXaGD9Ahhy5hfsnv>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 May 2025 17:19:16 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	alvin.lee2@amd.com,
	zaeem.mohamed@amd.com,
	alex.hung@amd.com,
	skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] drm/amd/display: adds kernel-doc comment for dc_stream_remove_writeback()
Date: Sat,  3 May 2025 14:18:51 -0700
Message-ID: <20250503211902.70141-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds kernel-doc for externally linked dc_stream_remove_writeback function.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
V1 -> V2: Corrected checkpatch warnings and errors

 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index e6e41678525f..b883fb24fa12 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -569,6 +569,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
 	return true;
 }
 
+/**
+ * dc_stream_remove_writeback() - Disables writeback and removes writeback info.
+ * @dc: Display core control structure.
+ * @stream: Display core stream state.
+ * @dwb_pipe_inst: Display writeback pipe.
+ *
+ * Return: returns true on success, false otherwise.
+ */
 bool dc_stream_remove_writeback(struct dc *dc,
 		struct dc_stream_state *stream,
 		uint32_t dwb_pipe_inst)
-- 
2.49.0

