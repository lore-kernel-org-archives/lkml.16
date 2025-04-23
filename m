Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70627C87C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418379; cv=none; b=cm630R6jazVyhYK/wDFWAguqQIyJ+DrhU4DD3fcU5+YFUjLNqNBLmvNCRl3+NGkqKxtgYYIA+HxMtKGeIHtYqhFEtDEmKdYZY4F4H1jtWCS2KlUwSjctILm1xIx/+ejM8Yc9W5UpsxkY2cr8db0LAFm1XBUfV1in5+rVMjkbd1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418379; c=relaxed/simple;
	bh=2PnMWJoU9CfQIN5xfqfk8HzXGyVnk1rUgJBtPJB/9Bk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=Vcz+uUk7ADz+xgNvx7M3aH6Qd1jPaD5ivgx9zGyTA7ahuKlDgV/WfM7Q5lvcETO9LwEYgN7xzbSfLlRzeLL6G6lRCzTazxV9P48M4sm/Y+iCiTESNviVLWGXm6mnEn2F6YvHozJGE1n6sZu53o6D8SjsaGGtFkFB03G+3rEfu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=qvPF+39H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MhYKBDkO; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="qvPF+39H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MhYKBDkO"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 50FC31140241;
	Wed, 23 Apr 2025 10:26:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 10:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1745418375; x=1745504775; bh=RQ
	HuFyRBEdBA6ZXvRnun39XQy6tPOiyfd7cH9yIyuFc=; b=qvPF+39Hmqo0aihsUN
	jmC8u+OJzaWwCsFbUTmCNs5Wq3QrCFX0Ax2xMFth1HVUVmFd+KRWQKF8Oo4sC9x9
	+oLlX6MBQZtXaqB9jpAPc9zNuAb+Pn3zsQ06in7H6VguCT1T+o6nyZjlwBOBCgJu
	t7pGqUt6RE8EUALgOUMBKGwqqjzKu2LwMBN83fEULLfx3SQdcBgHrb+ptKXHvj7e
	0WgS32HaFKTuZebvu2EpNvnQCeuyDqmbsiUfYe+QJGJB7uOarHt0ujyfcQNMIBv+
	pPAM3E22MfR6ewXA1K0y6H2mKR++9pGxnuE7+fxwP7iv/UBn0ZTzUumcIBGKm4VA
	ZRaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1745418375; x=1745504775; bh=RQHuFyRBEdBA6ZXvRnun39XQy6tP
	Oiyfd7cH9yIyuFc=; b=MhYKBDkOVa/DYl8lu5+EL1jWwAbk8T/VeXHbvVSkL+n5
	I0CsxKgKv3GsjWCbNJfVEFFVNnCKvQTu6HmvdbkA4nE80Nb9NEaD9+RjkFGSk5v0
	Ko3fiJJns1t9qLkXs/SewqNATdLIVP9MEvjgm11V3DqR9zgC9vqUP2rRXH76dB/c
	QBR15AN9QZogzogcc+i9abKUk81zEl4TdF8VcOL0eGHyL799iRbH1RfkllbyOEvk
	zxsXg2VDitWrRq2shenWRyqqIuRugwLEm5CfodHpJHehKaBNf/MiJePuHdlraZcS
	5k1w5g1Ns6v93KUZC5Goi0lID73RZ4qKZuDhmW6PjA==
X-ME-Sender: <xms:h_gIaBupqtuONzLiTkl1P95dy1UBUj0TbK_RCUrMmkdfArckdfHX2g>
    <xme:h_gIaKdecnKeCZ1mbETBZqalHFe-dhomIObaG7JqssaDLmLpTqvbzskVF47hT1WuM
    ZIla3p-koPpfcWANxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhkeefgfejleduveevleduhedvueelheekuefh
    geduheejvedujefgffffveelnecuffhomhgrihhnpehllhhvmhdrohhrghdpphgrshhtvg
    gsihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:h_gIaEyvEIe65oaPgG7qwE-H3vh2jSULZUJhw9_K_qm1IQ91wY_A5A>
    <xmx:h_gIaINXjEbsP_hhIePeXyXwpvpyyf_L5nn7YiGqY1tYDpjv5Ls9Kg>
    <xmx:h_gIaB-5aKPHk7WDHT2dYjzBmxlcfd8De8c4ap4k-QwetJfiDwRD6A>
    <xmx:h_gIaIVIY7V7R2Bpw_MrXeA2BjLJwMPv-HM8yEPqyEfAjayXBb16rA>
    <xmx:h_gIaA3REe5Fc6DAIlNjEANwOMPXsvrUOKRKxhlN128JYe62bPiJkrkt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 016D22220074; Wed, 23 Apr 2025 10:26:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3e40cc2738116353
Date: Wed, 23 Apr 2025 16:25:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <ed3bdbc7-63d0-4d9f-be2f-22fcdb52d32c@app.fastmail.com>
Subject: objtool errors and warnings with clang-21
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here is a list of issues I currently see with linux-next and llvm-21 from
https://apt.llvm.org/bookworm, along with the .config files:

https://pastebin.com/mRxkgudJ 
drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0xe: unknown CFA base reg 0
make[8]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o] Error 255

https://pastebin.com/7XEcstHP
drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17f: undefined stack state
drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17c: unknown CFA base reg -1
make[7]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/input/misc/uinput.o] Error 255

https://pastebin.com/6wAzkUL5
vmlinux.o: warning: objtool: ___bpf_prog_run+0x208: sibling call from callable instruction with modified stack frame
vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch+0xdb: call to __msan_memset() with UACCESS enabled
vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf8: call to __msan_memset() with UACCESS enabled

https://pastebin.com/PQZDZV18
fs/fat/dir.o: warning: objtool: fat_ioctl_filldir+0x717: stack state mismatch: cfa1=4+168 cfa2=4+160

https://pastebin.com/StQRVCfQ
sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: wcd9335_slimbus_irq() falls through to next function __cfi_wcd9335_set_channel_map()

and a bunch more fallthrough warnings that are likely all related to that one:

drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function __cfi_dc_fixpt_sinc()
drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_catalog_ctrl_config_msa() falls through to next function msm_dp_catalog_ctrl_set_pattern_state_bit()
drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()
drivers/media/i2c/ccs/ccs-core.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
sound/soc/codecs/aw88399.o: warning: objtool: aw_dev_dsp_update_cfg() falls through to next function aw_dev_get_int_status()

     Arnd
