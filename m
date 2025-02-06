Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D419E7ED
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864332; cv=none; b=h9QSkrprogxgcdAtynsrWBiEuOXWHauUo5vaaNQm7lvcmHrrbVsRZFwiQZte27C19vr+dTvLqQbOB4doqu9AfWBmqdtnzOCYVZV5SejMCWDGriHhWNmjpkENYHqz8erHl+FcokL1vnmjWu0XtFBAIUUSRhO1Oe7kHPcJDvIfVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864332; c=relaxed/simple;
	bh=991h/Sp9bHvzL1FPfx/Pd2Q/3MihxGjW8wQQBLefe0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmayUe/sBqkR285D3+0FLEQL0EU3oKa1V/qjBTrNaQmaBJ8RzkvvTkq+0OvMZtML5oMIbgL1uriyux8Ytzu9GxcXLvKY1MiUIQTRhBUKkITjcjrgnp8dRk1Mkj3MJO4D2Ou301zZj2JU9YBpw7Nz+uIl8LC5CCKlJztc7USpiRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KVRrfZcG; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KVRrfZcG"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6b5m2BzlgTxw;
	Thu,  6 Feb 2025 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864319; x=1741456320; bh=AN+da
	vxLbqfUIW7xgjHbssMgmGmtJu6D9axu8QX4ngg=; b=KVRrfZcGkDygXwTFOY++t
	wa0Ljrg4zJ8+erB0sg7xLnmtxbzljNMsxBdXYRISQnCJ6VajskCsWYPqvzwAVax/
	mOIMKxci3hqgnRdaYpDrb3qozPQdP7PE7NUC4p8V5PJ3vHsU4r9k8AYWxXG3rYiH
	ltJI6zbTeLhDMac9PtcqtzyyU5TdD/cwF4IHJfA7x3MdaLFXBLOqpaijhrSZi4v5
	Ww0Bn/2JXnOnUF+yxx3neB8iuTLb8m2DEvhcK7yZ6kEJuAZtov4mLef5nC2nQtje
	2w+IqaiyZjKU3Nzs2nZQMSQV5ofNvuoYCpSSrVhTeuBFG+UDUrTMrCB8aKs8nyFA
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id F70F9UekI2wl; Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6N5z0BzlgTxg;
	Thu,  6 Feb 2025 17:51:56 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH RFC 14/33] ice: Split ice_dcb_rebuild()
Date: Thu,  6 Feb 2025 09:50:55 -0800
Message-ID: <20250206175114.1974171-15-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Prepare for adding a second caller. No functionality has been changed.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/ethernet/intel/ice/ice_dcb_lib.c | 46 +++++++++++---------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/e=
thernet/intel/ice/ice_dcb_lib.c
index a7c510832824..69a4b84f935f 100644
--- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
@@ -526,6 +526,30 @@ ice_dcb_need_recfg(struct ice_pf *pf, struct ice_dcb=
x_cfg *old_cfg,
 	return need_reconfig;
 }
=20
+static void disable_dcb(struct ice_pf *pf)
+{
+	struct ice_dcbx_cfg *err_cfg;
+	struct device *dev =3D ice_pf_to_dev(pf);
+
+	dev_err(dev, "Disabling DCB until new settings occur\n");
+	err_cfg =3D kzalloc(sizeof(*err_cfg), GFP_KERNEL);
+	if (!err_cfg)
+		return;
+
+	err_cfg->etscfg.willing =3D true;
+	err_cfg->etscfg.tcbwtable[0] =3D ICE_TC_MAX_BW;
+	err_cfg->etscfg.tsatable[0] =3D ICE_IEEE_TSA_ETS;
+	memcpy(&err_cfg->etsrec, &err_cfg->etscfg, sizeof(err_cfg->etsrec));
+	/* Coverity warns the return code of ice_pf_dcb_cfg() is not checked
+	 * here as is done for other calls to that function. That check is
+	 * not necessary since this is in this function's error cleanup path.
+	 * Suppress the Coverity warning with the following comment...
+	 */
+	/* coverity[check_return] */
+	ice_pf_dcb_cfg(pf, err_cfg, false);
+	kfree(err_cfg);
+}
+
 /**
  * ice_dcb_rebuild - rebuild DCB post reset
  * @pf: physical function instance
@@ -534,7 +558,6 @@ void ice_dcb_rebuild(struct ice_pf *pf)
 {
 	struct ice_aqc_port_ets_elem buf =3D { 0 };
 	struct device *dev =3D ice_pf_to_dev(pf);
-	struct ice_dcbx_cfg *err_cfg;
 	int ret;
=20
 	ret =3D ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
@@ -574,26 +597,7 @@ void ice_dcb_rebuild(struct ice_pf *pf)
 	return;
=20
 dcb_error:
-	dev_err(dev, "Disabling DCB until new settings occur\n");
-	err_cfg =3D kzalloc(sizeof(*err_cfg), GFP_KERNEL);
-	if (!err_cfg) {
-		mutex_unlock(&pf->tc_mutex);
-		return;
-	}
-
-	err_cfg->etscfg.willing =3D true;
-	err_cfg->etscfg.tcbwtable[0] =3D ICE_TC_MAX_BW;
-	err_cfg->etscfg.tsatable[0] =3D ICE_IEEE_TSA_ETS;
-	memcpy(&err_cfg->etsrec, &err_cfg->etscfg, sizeof(err_cfg->etsrec));
-	/* Coverity warns the return code of ice_pf_dcb_cfg() is not checked
-	 * here as is done for other calls to that function. That check is
-	 * not necessary since this is in this function's error cleanup path.
-	 * Suppress the Coverity warning with the following comment...
-	 */
-	/* coverity[check_return] */
-	ice_pf_dcb_cfg(pf, err_cfg, false);
-	kfree(err_cfg);
-
+	disable_dcb(pf);
 	mutex_unlock(&pf->tc_mutex);
 }
=20
