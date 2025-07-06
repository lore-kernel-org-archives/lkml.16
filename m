Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB515624D;
	Sun,  6 Jul 2025 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787772; cv=none; b=BNdVF/xSSzkUVQPoBS6lxwUf/ZiqHtWOy9OxqBIGdFF1ykvBV8DnCR89ausHe/UlfxUPYIYV/KGyG0fLKbveQelEHYYstXlCQjj/sHMrVBwUD8vd8rpnspIyOUES/i2UL2P8Zeo0ExcBIHGMmLZiUUBmSPgUaYURdLLhZp5uEuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787772; c=relaxed/simple;
	bh=B+rj9gtuWsZlrrTCtaLttHYTPr4SirD3bkseZRtUN34=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Lj3skQIFwGJDdzANpYwOHotysmrUo+P5u2w+RW1oo3qU9QTgifGL//rHtMo5jjKuAVGfoI5gEJSDFVAtU2udGAN7lfa1Ahin2uxm3dKHAosk5ALIcUny4eyXU1KZjAryEjyGdw7O7fm1lKfApg1UXTWfW/KN8EHSldt0kWBNc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oesKeP1U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nEGCuRdc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oesKeP1U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nEGCuRdc"
Date: Sun, 06 Jul 2025 07:42:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751787768;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCMue9+JSJFDxGJn/dq8XOv33S73PZSQk0jrHc1YnMU=;
	b=oesKeP1UlA2RhzbMfXnAKTu/iPT73oUIgeevDwdz/ONGBPuIEYJiUzS5+Gy9YIwwVg62L2
	+4f/VY3djAlsecPFmYKpNYJSqFheTIL6xBnewC9TWHilldWlGQobts2OVDX26W4egORJJj
	AiRv2JxrsCClM3jflbNHyeatHbeS9p2NUDGccbIc0DJ6QfVvvoL41BfFbmKjJZV0Vy8XYJ
	Wit/ecMoxyidg/eW5zRh6NTfak1Ba+AgKQgrvUqy0MnekRpuYZFcTljmQyDQDr+LenpSKU
	+zH28XLji3DKYIbwfYbvx2IBYTnsL0ik4eFM+QrSpJdmQyWiLcOSu1qpQR9ybg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751787768;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCMue9+JSJFDxGJn/dq8XOv33S73PZSQk0jrHc1YnMU=;
	b=nEGCuRdcb6wuHZ9aXRVTJih2666oyg7zHm/EgVMhG69YCuFwF+YyK+8H3Nfs8FSC4j+9Z2
	Zk4DJM+V9Ekx3GBQ==
From: "tip-bot2 for Terry Tritton" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] selftests/futex: Add futex_numa to .gitignore
Cc: Terry Tritton <terry.tritton@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, andrealmeid@igalia.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250704103749.10341-1-terry.tritton@linaro.org>
References: <20250704103749.10341-1-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <175178776741.406.5971124144574346721.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     46b0a67e8f22d2dbc679b37b26c5ff0f50424847
Gitweb:        https://git.kernel.org/tip/46b0a67e8f22d2dbc679b37b26c5ff0f504=
24847
Author:        Terry Tritton <terry.tritton@linaro.org>
AuthorDate:    Fri, 04 Jul 2025 11:37:49 +01:00
Committer:     Thomas Gleixner <tglx@linutronix.de>
CommitterDate: Sun, 06 Jul 2025 09:39:01 +02:00

selftests/futex: Add futex_numa to .gitignore

futex_numa was never added to the .gitignore file.
Add it.

Fixes: 9140f57c1c13 ("futex,selftests: Add another FUTEX2_NUMA selftest")
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Link: https://lore.kernel.org/all/20250704103749.10341-1-terry.tritton@linaro=
.org

---
 tools/testing/selftests/futex/functional/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/test=
ing/selftests/futex/functional/.gitignore
index 7b24ae8..776ad65 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -11,3 +11,4 @@ futex_wait_timeout
 futex_wait_uninitialized_heap
 futex_wait_wouldblock
 futex_waitv
+futex_numa
