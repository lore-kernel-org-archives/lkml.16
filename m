Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CB2741DF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422529; cv=none; b=Ii9Au380rhCAAlzAb6WxmQY2+GK7pOWA57XPFzilXCS+/WgIcwj4HXOOdKsG26tuotltr3luVRV07W2CUHSH+O0i6KLoyLd7pFlJVnhdYr+4sFzTCowl9txqvqejneYQIKLhVb3XU8xjKMOtfb7JCwt4rHHeayoxKZYg3FXRqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422529; c=relaxed/simple;
	bh=1il/dB19ylyruXfeVF0bzVE5iRhTAf5MNLxEdiYkhO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDcTsl9inCkeueBD1DkyRP4Hm349vI3O0+iPGXD3LDbp5BI6Ios5zxsKsmREXwvGD/7UckiinSDt7NVQR/rkc8d7DyGgmvL3qaF7AyLY7Any3H9fUMlVty1oHDia5NoQDZ0GPpNKR1DZOsjXdS5K5YYsi5H9cUXR2Tp7D39ihVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4vZp7oAz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VRsyKGyV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4vZp7oAz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VRsyKGyV"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748422525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq4F0YaCcYiesX5BYOqiqK340+o2Iuxu8rVBteNA9h0=;
	b=4vZp7oAzVnXmjXpcr6iL1OVQMKK6Q+C58VcAKmbiu5SsRp+vB3ke/G7S9JazUK1pmvqM6K
	HZ6yy2Cgdc2zJoz4ihIXHMQeSe80fcp+ms7wTJyexOJK884JUBJvsXfhBofyIqzjgmgOKg
	L/JsWDsOIcSuZ8Ji2fnrqszXW22USQ/R/0tLXOaszCopBpQTKNKlbGVICL1bP90vei1Bk/
	yamGXjMBY5No4BSHOXO1U2mmWHZck8Ud6oMqOcPNIO2HACts+jtMRYVOjmS/DKl1TMAfW/
	EQWIdE+k2oiRwZ2GDhBkXUw1YvvkHRJcJKI8HLP/apkLuKLBr0GMDYNexahX+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748422525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq4F0YaCcYiesX5BYOqiqK340+o2Iuxu8rVBteNA9h0=;
	b=VRsyKGyVUpUFH2kDQrww8HjCXWjyTP/KE2Bp6Cj6RqbKPzmMJxwhWtUxS/dOkDPd3wxW6K
	dIikHcOdrxHCDoCA==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] selftests/futex: getopt() requires int as return value.
Date: Wed, 28 May 2025 10:55:19 +0200
Message-ID: <20250528085521.1938355-2-bigeasy@linutronix.de>
In-Reply-To: <20250528085521.1938355-1-bigeasy@linutronix.de>
References: <20250528085521.1938355-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mark reported that futex_priv_hash fails on ARM64.
It turns out that the command line parsing does not terminate properly
and ends in the default case assuming an invalid option was passed.

Use an int as the return type for getopt().

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/31869a69-063f-44a3-a079-ba71b2506cce@si=
rena.org.uk/
Fixes: 3163369407baf ("selftests/futex: Add futex_numa_mpol")
Fixes: cda95faef7bcf ("selftests/futex: Add futex_priv_hash")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 +-
 tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/t=
ools/testing/selftests/futex/functional/futex_numa_mpol.c
index 20a9d3ecf7433..564dbd02d2f46 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -144,7 +144,7 @@ int main(int argc, char *argv[])
 	struct futex32_numa *futex_numa;
 	int mem_size, i;
 	void *futex_ptr;
-	char c;
+	int c;
=20
 	while ((c =3D getopt(argc, argv, "chv:")) !=3D -1) {
 		switch (c) {
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/t=
ools/testing/selftests/futex/functional/futex_priv_hash.c
index 2dca18fefedcd..24a92dc94eb86 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -130,7 +130,7 @@ int main(int argc, char *argv[])
 	pthread_mutexattr_t mutex_attr_pi;
 	int use_global_hash =3D 0;
 	int ret;
-	char c;
+	int c;
=20
 	while ((c =3D getopt(argc, argv, "cghv:")) !=3D -1) {
 		switch (c) {
--=20
2.49.0

