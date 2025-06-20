Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253730E83E;
	Fri, 20 Jun 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418075; cv=none; b=oMSs0T2NolzVJct1i+4nVjrwDgNMeJKYPk1eF4pZTla8CL4i1ZWzGQwiqSoP4LLl/svz1G7Kq2Yn+Wt5lizJfusA10tFJoVHR50wSUf7pX6rWzUSpZKKx4x5vDHBHUP2LY+c6RKZCUk5IPf+jGbDPa2ObadS84MFdd7VDrfqzRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418075; c=relaxed/simple;
	bh=fFW0nj5wKajZBoxD+NK/ptNflE3yLPKttfp9Lz+wirI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QJLxkjzvGb0VARtxe7Ahn7EbZAhkGK7Tz/dj1Vm9vNNb5q+lERrvhkuAFPa/Q1DbFWK1RiHehLkXIyTykZUXrzwQtGg8J+3yIC9Bx44Z7EDPQnVZpxznIshvUCkLvMH0wJC3f2lCoqEA1GGOjS0GMlgR88KbRqwkIVFwry+9/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfcSvTP2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfcSvTP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BF5C4CEE3;
	Fri, 20 Jun 2025 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418075;
	bh=fFW0nj5wKajZBoxD+NK/ptNflE3yLPKttfp9Lz+wirI=;
	h=From:To:Cc:Subject:Date:From;
	b=pfcSvTP2hDTGoGFpx+wgbFLNAe14F1ZAtJFntSgbnCARjLt2kkn/gaM3muchpfYts
	 EsgBZvKsCk7xvF51hkAd3WRjkQPAmFJyxd02cL4RrIGLxEqOg3g9TFJcxyUPZBQxB1
	 xiria440gVVMqf0gLmj7oikBSOycoXF0dzpg4gApGTyDkIP83PNVT+H/ms5HG6MV+W
	 3h9WxUqrcZqEsunlc0JPbTDUSHvALYpq5/h8Xg05iSanM/n6qZJV4vog5IKNAA4Eha
	 V/Ey0pmAm+mCoxQkt2MhnKWTq9VuWhJqOGgfMTfBROJ/qDJ6YecqkAVZ+72Rgj3D3+
	 8AWZz764BmHAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Akihiro Tsukada <tskd08@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mxl5005s: reduce stack usage in MXL5005_ControlInit
Date: Fri, 20 Jun 2025 13:14:23 +0200
Message-Id: <20250620111430.3365987-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This function initializes two large structures with arrays. On at least parisc,
the specific code sequence here leads to a badly misoptimized output from
the compiler along with a warning about the resulting excessive stack usage
from many spilled variables:

drivers/media/tuners/mxl5005s.c: In function 'MXL5005_ControlInit.isra':
drivers/media/tuners/mxl5005s.c:1660:1: warning: the frame size of 1400 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Splitting this one function into two functions avoids this because there
are few temporaries that can be spilled to the stack in each of the smaller
structures, so this avoids the warning and also improves readability.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/tuners/mxl5005s.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index 0e811c5eae6c..8f262c7f62f5 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -1174,7 +1174,12 @@ static u16 MXL5005_ControlInit(struct dvb_frontend *fe)
 	state->Init_Ctrl[39].bit[0] = 3;
 	state->Init_Ctrl[39].val[0] = 1;
 
+	return 0;
+}
 
+static u16 MXL5005_ControlInitCH(struct dvb_frontend *fe)
+{
+	struct mxl5005s_state *state = fe->tuner_priv;
 	state->CH_Ctrl_Num = CHCTRL_NUM ;
 
 	state->CH_Ctrl[0].Ctrl_Num = DN_POLY ;
@@ -1663,6 +1668,7 @@ static void InitTunerControls(struct dvb_frontend *fe)
 {
 	MXL5005_RegisterInit(fe);
 	MXL5005_ControlInit(fe);
+	MXL5005_ControlInitCH(fe);
 #ifdef _MXL_INTERNAL
 	MXL5005_MXLControlInit(fe);
 #endif
-- 
2.39.5

