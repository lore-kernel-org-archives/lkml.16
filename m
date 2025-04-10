Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C94204840;
	Thu, 10 Apr 2025 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313162; cv=pass; b=jvQoQJNdRdALW3aUansWvu9CVDddD0I2iYBQDf5JCl+RREl9U02F8nUa4rgzS0KXuK/lz6GWc25heCt2f4EF0ZniRCy1Yz7EDSojdtLFpjEDFWde1W2ZaAohhnjWKZHZ4nIs6JP7TJSvDuC81q+yqaFe2O8qe4D3Cyr3XCQdyTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313162; c=relaxed/simple;
	bh=Rz8eNvj4dTzcpDaeCQBvlJV85ksaEcJQ+TTs3rtoaMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rufwH61H7C0WK8TdiICpxGhGLJu+keEYUsiNMS8NU3bPkXcvbJUEOCD6gvBJHc5lXKygVmtUUgy7tRle1hprCophKWBZXVUVBgHELTLDyP43y9k2lz39w4iHmh6hTEHTizNJTtCgDwSAIME6Rels8IRuFSWOi97WqCN1gPB9RUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=HKZb5632; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="HKZb5632"
ARC-Seal: i=1; a=rsa-sha256; t=1744313143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRkMhMaG0GaHcQRVxjUOf0Vyb3VdgkRmDmIw6JAkm1bgWFC2PN10sbMmDmtdrNCfZHdGvos6DburExu47TktUSMzosO9CqvMKjG0PTzQiUXoU0KfMkEWfAyWdk+t2J28+g0CR0/TSsFVegc/xfw8XSBi58EGqae3tiAorwIuEgQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744313143; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XQmTpBmWGhhASqTYxUhuA64rZTqnNcKbjzNnRjkhCQ8=; 
	b=RJM8fGVyrIDpyJfuke3gdL+AMQ2cC2mP8hPZylDM1WxsA2armJc9O7+gxKhVwbRORElAYkRoCEbee3rdOwMqTzO8TMU7pa0WP17C9YGUxsFlPDvBgIGhR8CRfyknFhBd2usUAPJVxy4QUwdWshLwY1YeMVDs9yB4QSQQZ/EBjLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744313142;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=XQmTpBmWGhhASqTYxUhuA64rZTqnNcKbjzNnRjkhCQ8=;
	b=HKZb5632IMXzMDPHQFQacWdkiZmxa9JUufHmqbLNCajbbuAhBuD1tm7iXu9IJ0/a
	RkiFfacMfpXR8xqYmQm4CKNG5YEwGPWCuyJCX7/kOL9ecxMqKt5G6/o1L0+feyszkdl
	dqXUU/ZdEJhria9tQfl+NkNx4+K3h5fWYwG2epUs=
Received: by mx.zohomail.com with SMTPS id 1744313141034419.0536528588136;
	Thu, 10 Apr 2025 12:25:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:25:32 +0200
Subject: [PATCH] ASoC: test-component: add set_tdm_slot stub implementation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-test-component-tdm-slot-v1-1-9c3a7162fa7a@collabora.com>
X-B4-Tracking: v=1; b=H4sIACsb+GcC/yWNQQ7CIBBFr0Jm7RggoLFXMV0UGJVEoMLYmDS9u
 2iX7yX//RUa1UgNBrFCpSW2WHIHdRDgH1O+E8bQGbTUVholkakx+pLmkikzckjYnoXRGWPPyvl
 L0Br6eq50i59/+TruXOn17ge8S3BTo18pRR7Ecjoqi9UrGLftC8INUO+WAAAA
X-Change-ID: 20250410-test-component-tdm-slot-b44571bc9d22
To: Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The test-component driver implements various stub callbacks. One
of the ones it doesn't implement is set_tdm_slot. This has no
functional impact on whether ASoC core believes test-component to
do TDM or not, it just means that any TDM configuration can't
readily be dumped for debugging purposes like it can with the other
callbacks.

Add a stub implementation to allow for this. The output uses dev_info
rather than dev_dbg, to be in line with the set_fmt stub implementation
above.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Quite unlike how I initially thought the code worked, this stub
implementation of the DAI op isn't actually needed to make ASoC core see
it as a TDM-capable DAI. There's no checking of that sort, it seems. I
mistook a different debug print I added for the test-component output
when I was testing this, which lead me down a stray path about 20 shaved
yaks deep.

Still, the stub implementation is useful to make sure DT properties are
set correctly in e.g. an audio-graph-card, meaning the dai properties
are in the endpoint nodes, which wasn't the case for me. In particular,
I can just swap the compatible of a codec out for a test component with
no changes to the rest of the node and immediately get to see whether
ASoC core sees my devicetree the same way I do.
---
 sound/soc/generic/test-component.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 5430d25deaef18700bbefc3f297246fe93945472..89b995987e2d46f58e0cbeb81816d233320edaec 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -140,6 +140,15 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int test_dai_set_tdm_slot(struct snd_soc_dai *dai,
+				 unsigned int tx_mask, unsigned int rx_mask,
+				 int slots, int slot_width)
+{
+	dev_info(dai->dev, "set tdm slot: tx_mask=0x%08X, rx_mask=0x%08X, slots=%d, slot_width=%d\n",
+		 tx_mask, rx_mask, slots, slot_width);
+	return 0;
+}
+
 static int test_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	mile_stone(dai);
@@ -203,6 +212,7 @@ static const u64 test_dai_formats =
 
 static const struct snd_soc_dai_ops test_ops = {
 	.set_fmt		= test_dai_set_fmt,
+	.set_tdm_slot		= test_dai_set_tdm_slot,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -214,6 +224,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
 	.set_fmt		= test_dai_set_fmt,
+	.set_tdm_slot		= test_dai_set_tdm_slot,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,

---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250410-test-component-tdm-slot-b44571bc9d22

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

