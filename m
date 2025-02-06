Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D471A725A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864349; cv=none; b=Hvx7HBm/fvhEgwzYXyQzNzxUZFvTZ830SVO8JHpEIgtFDfexQhwML5YLhn7yr9Q9R8CynexhdXyUJi4Lo5VzFzEf7lbP/WHiclKw4bXghme447lSvx85dujIBk3uGoBPcBOFza5K228mWRMizJh0z7nWQuYzHHwOHw5Lbi9F+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864349; c=relaxed/simple;
	bh=6HjUpqKNiLrpohPfuTMgr2B2AVGyZSlgHY/uQTNV5EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7kIdRu+4dItWh9i0ViE5uEupMyjXB1V0kgm8J609YRP4NeNoD25BUqZgChryyp8C2I1s2l4Hd9l23gCe2RH4/HJsHJmKJzmQ7lEdL/g0ZSb3CjOintqauvmO+Uzeh/3aO9oWscn0o5RRWp9LhkZTqeSlwy8neFcQm8WOCxVptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=WwNLgVEs; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="WwNLgVEs"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl700gsWzlgTyG;
	Thu,  6 Feb 2025 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864340; x=1741456341; bh=+iJQD
	ECuEnObM8phqIQOIp+6skQaIYn7znB5SWlVxmc=; b=WwNLgVEsEy0YRbR2xF9pT
	LGm2ng559UyIYpFA3hvE2TeqZ9052AWQBu4LnNPG3/PGrMqCYeU9rP9/9S0jLAl1
	pYVFbOA3+vD1VXqevEtPqhCVPWkiX3ROxffWQmzxzfbiC6NyIamE3SJ0LAdTZfiy
	0QfN7FXvTlxq2MLNfSh49i8oyUDMH1+QuavSunWDnXrYnujAkepKIN+Luq6DPCoe
	CDBuwQCazb1t6eAJERYwG1HAd/kaHdABkpDjkerhWkMGGYfoo7eIKwYZaobljkTX
	zd1q5qetKvfRJuVwDzoLbEUQexWwZ8h+lIY/f/S0TAUUp7/DOcm3x6NsfCf2b1dT
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id hH542d1XV9gZ; Thu,  6 Feb 2025 17:52:20 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6p0VRmzlgTtm;
	Thu,  6 Feb 2025 17:52:17 +0000 (UTC)
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
	YiPeng Chai <YiPeng.Chai@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH RFC 21/33] drm/amdgpu: Fix locking bugs in error paths
Date: Thu,  6 Feb 2025 09:51:02 -0800
Message-ID: <20250206175114.1974171-22-bvanassche@acm.org>
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

Do not unlock psp->ras_context.mutex if it has not been locked. This has
been detected by the Clang thread-safety analyzer.

Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: b3fb79cda568 ("drm/amdgpu: add mutex to protect ras shared memory"=
)
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp_ta.c
index 38face981c3e..6b0135ce83b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -332,7 +332,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file=
 *fp, const char *buf, size
 		return -ENOMEM;
 	if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len))=
 {
 		ret =3D -EFAULT;
-		goto err_free_shared_buf;
+		goto free_shared_buf;
 	}
=20
 	set_ta_context_funcs(psp, ta_type, &context);
@@ -340,13 +340,13 @@ static ssize_t ta_if_invoke_debugfs_write(struct fi=
le *fp, const char *buf, size
 	if (!context || !context->initialized) {
 		dev_err(adev->dev, "TA is not initialized\n");
 		ret =3D -EINVAL;
-		goto err_free_shared_buf;
+		goto free_shared_buf;
 	}
=20
 	if (!psp->ta_funcs || !psp->ta_funcs->fn_ta_invoke) {
 		dev_err(adev->dev, "Unsupported function to invoke TA\n");
 		ret =3D -EOPNOTSUPP;
-		goto err_free_shared_buf;
+		goto free_shared_buf;
 	}
=20
 	context->session_id =3D ta_id;
@@ -354,7 +354,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file=
 *fp, const char *buf, size
 	mutex_lock(&psp->ras_context.mutex);
 	ret =3D prep_ta_mem_context(&context->mem_context, shared_buf, shared_b=
uf_len);
 	if (ret)
-		goto err_free_shared_buf;
+		goto unlock;
=20
 	ret =3D psp_fn_ta_invoke(psp, cmd_id);
 	if (ret || context->resp_status) {
@@ -362,15 +362,17 @@ static ssize_t ta_if_invoke_debugfs_write(struct fi=
le *fp, const char *buf, size
 			ret, context->resp_status);
 		if (!ret) {
 			ret =3D -EINVAL;
-			goto err_free_shared_buf;
+			goto unlock;
 		}
 	}
=20
 	if (copy_to_user((char *)&buf[copy_pos], context->mem_context.shared_bu=
f, shared_buf_len))
 		ret =3D -EFAULT;
=20
-err_free_shared_buf:
+unlock:
 	mutex_unlock(&psp->ras_context.mutex);
+
+free_shared_buf:
 	kfree(shared_buf);
=20
 	return ret;
