Received: from sonic314-20.consmr.mail.sg3.yahoo.com (sonic314-20.consmr.mail.sg3.yahoo.com [106.10.240.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BDBB667
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747446517; cv=none; b=s0P294zp1xdrap6lEZGdjuH3JM7YdgFTB6qy9+WvBuETgozmEXUkPQSoJ7StcYFvvAiwvECXIWCkW+vqQAQXzk0RxVs40rsCnsMx+Iuazqo0f0hvezi82dtE6NK/fbiWQ2lI8I9ltc7Oxagdue2g3oAHPMbFFYfV32m/lC9TKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747446517; c=relaxed/simple;
	bh=d9yBeeUpCGVTHOgB2WX+dBsSPuifeRXix63rbhlEc1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=i0KOhw16rkmWEdmPCsQVj6dnsOF7bWWjR0/zti7YRusCm6fTTYnklGG5PKym2E5+D7t1lYGcWjTGHV/gmo5YKi2NAMIvQ5IG9uUCmr104hHvO0ztOYFIoRDkWMy8UcO8IAas4TzLKvQ9THNSoTzK6EvcIjDvWuqi3xqCnVmsfeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=qVe0bgNX; arc=none smtp.client-ip=106.10.240.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="qVe0bgNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747446513; bh=Pqsp8h438sdZA8gyyeRcDw//7DDxdzHk1kJORjR2Yds=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=qVe0bgNXzxat89yIVf3jM2OFEatw+ZZ5TNml5IJOBdtzFV9KYsMnqz9owZd+1Xfds2BISLZ/KKOE+/vsgLnpKolgeEUfbK5F7c3dLqnJu9/ZVks4WMGknNOQrknVNI+w9PPC3gXrBO24YMEJS6PMwIM24Fq3j2nzDh48QclmoIYUvK9pHvPY13xuEo6pahGrdBZjbs/u+atu0d1NflQHRwiT1H48ooCkXtG8uJJO/BQUKwImL1wd1Ymg3jSkck8XEL/HKGnFE5qfFheI3Ty3zMmarEt1tjsMr/FyHFq4Hov11Zm0BZ3fV5DX09Uthig16UOGaUf6yMIxt7thrtZ1bA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747446513; bh=oF3Axnak2kwRtk46+7t0jDysz/XGYLyD+poD7H5apCn=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aqKVTJUcacHYcfebmYw3f0q90FvztUF87OwTuZ3feFlGPHCkWCl9J7tDYHmhpCcwE3+horl7h7staaWDfIhmiGPjPqpeg02APsgFIxZMvLa74ZoNmUuqhkPPZWAWUvP6lZLt+lsvVactPwpMlLgVhwEQ568+3Em8DTJNuV5p8qE5yyPRLOrTPW93cRrNu/cHwCeocbs+liV3kEaosQXtrpVy13+lpOZHdncz6Q8sJdS+3k7vrIYZP6FjqqpIzS4gFiWSeQvkW05Lw654nx9pRg6EG+dWTnpVXLfLAtMX+kQxFxcOIgDWYiOORdLrH6RLir3eWS4yKd5wlfAUHBcMMA==
X-YMail-OSG: e6dsXxwVM1llLUXKclfvArj0UDKvaNs.fDZceUi9TKx0gjMtJ8F8yj4gJsbMbUN
 w42AbrvjrUm3YnM5qcxCOzIjImoyP98n0XwYLd1IsgFVmq7Vb0_GNRRmLuQ5uqFaW8V94FYdyhhg
 3AV2zTV7aWc6G2gZvAlLOuC3jEPbJQKuqG7yUVAPhEin80OzjUfJ8.GNRz1ts7HNHJSsqnpzrj0_
 vjb9LnkU_PgoiTxy_Kv30UcxrYLO9.b0XYfh02OZyR7Jy8eS5A2lkpkgXcU2B6Oqu.yHzh0wZApH
 .LjAT0DuXbjTWsXQjLk0ADj4w4cyUvz7_ZT7IyRURqcoT5n98IUzUHDdcTj24C2DkjsL3Y5J37d1
 IvXqIF7M5kULOuBDKAH_WMv416QZg4RIF.Yn2RiknR95Y751GQNVKSUS9VehEWb5i8NYWklR4J8O
 l2zZApuTyhvICV.JXPK4KJnvaphczah80gcTVyTNSSLBqg3ar3O.ifC0R7Kgu4SSBRGahf36dAr4
 GjkoZKhHKCRAO6v4lJiuUG546XUiyrSM9mzNEYJpyu7cFbOBtsjaDJ5FktogNX4tMNL.UnghIFss
 QsHyYDyTYaRfWo6Y0P3NGDnJBToz6WQN4WEFwtcraq.vfoxVkJq0A9d5Jm84w9MLH3xC5CO.aCgn
 xbQxJsBHB.9ebO5VpCZCRPRMJk3tlUB_oKAsGtirlfFLSX4vQ7sw6PqAgDTj3Z3dBHrGApkptwNk
 4l95Q_OoCA5DclFNWg_UwdYpezRkEagKAvYgD_tyxohwREjGendVXhXk_l95gWjJwGMfwzn1ngDH
 GMHt41.B9F.z7Bko7kWQ68iC4uibW4N0FdibclhObmjyz22E3Dz6TY.vj4Hep2C1hx_fphfDR07L
 QeQNTBiSt1vfswxM5iBiSC9aAQzVUsY6M_1FwGnArX8S6sayhLf8fSC6QpEiwNvcDv35OrtnS3we
 jWeDIRLuwjY_mXF3NGN9BRM8DGk6wVko1EKS5fUS10fw3aOHZshHyBUqMI0nZKoLOwXk4W.fJFw2
 kLSPH4DwEw97xzd1nAZhbGUsbqJhAuCfXm_hv6B8MEgFQHEYmLv0BtCly03996W5vVlTWKuYLff1
 HNMXjKPYirmOY9GKEhqG5g6.X4QZ3ME7AId.fKzIusiT3gqEin_665Qs4BMRkksR9D0s2rO93ojv
 cpoNCtJBmgffXcXUzHCEq.SGzEOIQkledfmEea_IQZqLinP8NUp9kpgMyKh1iXveLJWKPyGxcqyB
 rUuxYQOB8FWgBFhslv573JqddQUM5AaTU2IiyZMJzh6alUUZjzBVh1s9ScyAdb31ho3JJM20XFxh
 v8NZeJmLRbH8ZfMwfvth38c.jzYb2tzeo1UfLDXEvSFakgo.lq425Uenf1EtgBnV7qmD3rE4lTNy
 T6_E0pfOdbx0.m3IFzJ5MlyhWyX8U71aTXU6MT9l..jwAcKs4tmPTEaUGwV_GQpIu4WElUSpKgCF
 cNpKpnAbV_fo6dHMOsZPSpoKaweBbtlHXQTw2rLFPwuZ7fIlo45cKkl3euLCn8sY2fXwTB35bf6J
 3dbDokRY7JwBbQacei3BJCNE.cvLNtu8dVF8BP5DXbchAUpLdXlG2wl.zYkv0HFohutayAVJJ3Om
 .OF6l9I5Wv6bZOU6h7TdHslwbiGRROVc4l5oIcHKc6G.jaQGgufndJEfQbTfWe0Uz1F7htTbTo2L
 lKBLZ1i6TiVRvT5nuA6wC2aC8u419iX4ocHNlSAoBY7uzPgnQcSCuL_7NeKYSaBLjfDVwqSfLTkb
 O3r_A271t7bkan0XwYdkHzkWuVJVYx4xQSfe_MaFM7FImkD0u3U2Nwk_.t3wABtwaADnYR7jgU2x
 kyg9AYyX4mxwmPLMbsFIGpGs5efXRMk8CGa26AY9ujhn51s7A9QCNUONfj9_XkaVa.Va35Wwjb_Y
 mStlmGI00ZwlMIBM1eD6VAmtZ2IgSn5WtQxTfB8SV7yOcM3NX7rWDuZT09Xb6MUiWDvzVidAIB_t
 4QFopJtvHFir83_RchBZDdjEr88CWQru2yzKqTNs35cDlgzXQT5gKi6c3kx2.zOj5pqQ57u6NW.I
 QuGZb_zVI4xC_0titSJ4Ia1.g.Cw_JhQBs9joDjNnXwlKRkWgrkPaepg8_tvLQfl5x1vY3G717Oe
 nx9.aHHQxe_OjWOkLbRHytRCpLwQja3jSjDGoTKBO5m_UYdt.74rUKNpwKQc5Qs.KdpnumuWQSk4
 kbKKn6eDgasM-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 39c5416d-d905-441a-8389-d146e6afe8a4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.sg3.yahoo.com with HTTP; Sat, 17 May 2025 01:48:33 +0000
Received: by hermes--production-gq1-74d64bb7d7-f4j4n (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 22506f5cfb701406c748d40903521528;
          Sat, 17 May 2025 01:18:03 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: skhan@linuxfoundation.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	shuah@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: seccomp: Fix "performace" to "performance"
Date: Fri, 16 May 2025 18:17:22 -0700
Message-ID: <20250517011725.1149510-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517011725.1149510-1-sumanth.gavini.ref@yahoo.com>

Fix misspelling reported by codespell

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 tools/testing/selftests/seccomp/seccomp_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_benchmark.c b/tools/testing/selftests/seccomp/seccomp_benchmark.c
index 94886c82ae60..5822e25e0217 100644
--- a/tools/testing/selftests/seccomp/seccomp_benchmark.c
+++ b/tools/testing/selftests/seccomp/seccomp_benchmark.c
@@ -1,6 +1,6 @@
 /*
  * Strictly speaking, this is not a test. But it can report during test
- * runs so relative performace can be measured.
+ * runs so relative performance can be measured.
  */
 #define _GNU_SOURCE
 #include <assert.h>
-- 
2.43.0

