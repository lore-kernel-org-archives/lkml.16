Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5AD17332C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874239; cv=none; b=TWi9HYyaGqKfKtlPZBYoYY6TZUjhnY8//BSIA9GUqaZRCkLhxHXnhLbuXD+goCJ9u+Vf10fMfM3JWm5XchTVUnZu2pDsFvS5jfkCC/0UMe+LH0Q8QB3HCoZVFB9BP1oq6PaBbLVL4aApogT44MQHV4twqjKdwvmVq+I3Zs0rko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874239; c=relaxed/simple;
	bh=xPLw1Eyccx30LPPm9w3J49Jr7VvuQSiA7RQxNbPiwC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iU2Vdm7e3MBJvw6dDSfwhGdmJoB9MlQVWey+OPr1iAPFn7SDN80LoBE8EOWGgBd5iB55ecTBiZ3q7WBLPeCHFpfpkK9jeJEAs+IelE8xwi27LqPOz6Cjs8zALd01zhO4ltdCzkWFaV0UZLCvefvt1yDtq4eHkK5UUl27NBnQTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=sTJPLq9E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MMtesaQG; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="sTJPLq9E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MMtesaQG"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 073E61140278;
	Thu, 17 Apr 2025 03:17:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 17 Apr 2025 03:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1744874236; x=1744960636; bh=wBa+/RP16JDDqe808w2hJ
	uVvdiTrgtxeTmMlzvStV40=; b=sTJPLq9EtFyiOR4jh9Rcwu/sSeYkK5XrEQPW5
	4hHAYPA5xkjEanQfsd2CoqCVj7EMYrM9tNSnDCtntJFLdTHLjHnCY1nUA441Si7p
	uPTp0rDsha6+YV1ctisiOeQT0k/dvU+RyuePoOsZkig07IEwAgUSQeYJv2dHpaod
	nBKl0ItL7935QhDwwdZefu2IPRX5+px89zxwZy4j8rklip3RzovdszH40go2em01
	4qao95oJ6TRZQfxwlcPuisCtGbzun9j/mUYUjyp3mPh80l6jbclE5wqMhIgoz9pA
	ZiMquZmNyUt6hjYZg4DxfGC/FrxB1b8V+a0xP+E+7Jypve49w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744874236; x=1744960636; bh=wBa+/RP16JDDqe808w2hJuVvdiTrgtxeTmM
	lzvStV40=; b=MMtesaQGcRLx3hon9ZpbVrMnILd5aBNxTbbvlRB9EKKPPLAUouh
	c91kAppzMrAORAix9afQilU6hcVITGKZbH48nXo+3diDzNpoqi9khXU3D/MTests
	4I5DGqD2igFD5FNhefcjFxWt0aUa+1ieVFbYqq34yyBGrN52iDV5Mwy+Ae9I8lh1
	T8a+p13pOZjBeGha/jRdXrF+JAoelwpQuatVP5UJSPc9h4nWAImfacYYA5sCPwcs
	uPKbodx2iQ6UVOkikyo1IqREr3C/8h/jBnlDi6GKobTOHidUT6ckDCwh5lh3UnUe
	UXy8ROjuTqPi1W5nm57WqiptBpFiRj8JrgQ==
X-ME-Sender: <xms:-6oAaOLpkqsSZ2XLcuN2jZwDvojpScVm40lXc2QI3LJRbbxuPRadww>
    <xme:-6oAaGK9_Ot3rnBFcCtnEMEZydmLTkhZtITZbYAQSM_ZY7BrMipCzmap0ZkBX3dls
    GeoqEi238I-EpLrbbU>
X-ME-Received: <xmr:-6oAaOsGexYkveryPSvf6CZ8w81n1cAFgTFmQj1C1zzLbV2DNtmq83oyB5v4xSbnqijpvCHkKyvgJ32hTk6DgakEwuUb3YRo0laZAgEvMXbh37Ok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflrghmvghsucfhlhhofigvrhhs
    uceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefhvefgkeeiuddtudfhgefgiedvuefhhedtffejtddtfeekieefieejveet
    hfegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthht
    ohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhrghrrhihrdifvghnth
    hlrghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdr
    tghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpth
    htoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthho
    pegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegrih
    hrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhl
    rdgthhdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorh
    hgpdhrtghpthhtohepsgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:-6oAaDaAIIqhQK6lC0RXWX-Ww1pDfVeX8g3OnObQZDTFxlLH-o5UkA>
    <xmx:-6oAaFbfEkU2-AU4rA09x-Zzru4ZA27NApGGFp796YRFrCgwAntg9A>
    <xmx:-6oAaPD33lWzknQ5nWrUblnOVnSZM0L9w4KEc_IFU0cBikNatq0lNw>
    <xmx:-6oAaLbCjgbp4gvjasV9x4PgjzQsQLShLaAatajtAxMtb2LbtoK6Fg>
    <xmx:-6oAaIuldu4uXwnS9pfYzkSC2MVzVvXSjeM5DTolbYwg31e6iJ873JGs>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 03:17:13 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amd/display: adds kernel-doc comment for dc_stream_remove_writeback()
Date: Thu, 17 Apr 2025 00:16:19 -0700
Message-ID: <20250417071655.4794-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a kernel-doc for externally linked dc_stream_remove_writeback() function.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 0478dd856d8c..060ee6c3fc2e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -552,6 +552,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
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

