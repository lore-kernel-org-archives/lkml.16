Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626984D08
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685862; cv=none; b=mZ9Ui1EDfKkAo/CC2fnMgEMw/7OLPFmftoSajsZGlUiYsr37xXYIt3lHOSaRdefYSJbR37+tJP3cGxtYDMARWSDJc304yhrXnX7g8S4V/yLrxY4Zbp56ezYXkWLACmaRciFKQv+40WQgzx35nkmNGXB9ZyznKOcrUYUBzJpSvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685862; c=relaxed/simple;
	bh=PFA5HWFMoDGL8la6k67up5T8uL+WZ0lzAn5HvPX9pmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Nt3+OC2+Lq+kyW5fVfEL9XguEGR1gwrQQsTpSI/jM5lbQ2LztoY6SV3qqEOGWZaJqL9ErveKhKPKgVQHNf0J1IYpyEF5gBQvuTNq+IYa+sDy4a3ePgaUFYJDm/TD3gLvakrJocDbkKkl8nglu5MlPfQkKHUjb2KEX1QurpvxBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uiUjd1fW; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uiUjd1fW"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250403131057euoutp02e617b3fe5849d4694719d9c5b4c66c4e~y0Qx9QCAY0870008700euoutp02w
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:10:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250403131057euoutp02e617b3fe5849d4694719d9c5b4c66c4e~y0Qx9QCAY0870008700euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743685857;
	bh=3avMIeLMT80JwPS8QllYh+Im9sxBG8PH5Y7MmOihKd4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uiUjd1fWpnp2zr+/Lq0m3FED4aWbHIBMtvbCdE6IpCSd5DDP7TXt2tByRpT0l1c4P
	 IN+jzIRHAJVyN046CLmdOW32txlmZx3JXJfy2nzngSz3i/0xDpwmW+zRja1BP7vPHh
	 /ss5/KhET3WwEFB1TeA/1UGGtpQeRCl+xXEMyeFo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250403131056eucas1p2f3b98104f405560b9dd7b3a5a7456f58~y0QxoO1Ir1627816278eucas1p2C;
	Thu,  3 Apr 2025 13:10:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 93.C6.20821.0E88EE76; Thu,  3
	Apr 2025 14:10:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37~y0QxQcqZZ2734927349eucas1p1O;
	Thu,  3 Apr 2025 13:10:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250403131056eusmtrp12e49bd525e26a3187d5f62d0a0d68455~y0QxPySIL1700617006eusmtrp1G;
	Thu,  3 Apr 2025 13:10:56 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-0a-67ee88e0ced6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id D2.A0.19654.0E88EE76; Thu,  3
	Apr 2025 14:10:56 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250403131055eusmtip20b0101b8af387da1ea8a6be4d0b3a07f~y0QwuM7H40148101481eusmtip2z;
	Thu,  3 Apr 2025 13:10:55 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	ulf.hansson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
Subject: [PATCH v1] firmware: thead: Fix buffer overflow and use standard
 endian macros
Date: Thu,  3 Apr 2025 15:10:51 +0200
Message-Id: <20250403131051.1097423-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTcRjH+91tt2txds6ih6yMQUFS1kroqLCioPVGJkUk9HLodS51yi4r
	o3LmKotpmqao1eyFNme2NnWlvQylNi3aH6WRpDYoKK0s33tbL+vWy3+f5/u8fuEhcUWFdDKp
	0e7hdFo2RUnIJU73Z+8cX24fP+/+p2jm4/mjMqb7cR3GvLmTLWGeNJ4lGOeggWBswyaM8dRs
	YQyuYskyUu2wniDUnU9vE+ray1lqQ40bU3+4206o8+usSD3omBYri5cvSeRSNHs53dyYnfKk
	vEI2XT9v//WP2Zge9UecRGNJoKPBXdZBnERyUkFbEDQUX5GKwRACb+PbYGYQgbOhVvKn5W61
	K5gwIzBeHEZi8A7B2xHH7yqCng8+s+nXLJKcQG8Aq9iM0+cQ3LLpAhxGbwVb6xEiwBJ6Btib
	elCAKXop3GvJl4rLIsDV9AgX9VBoLXsVnBMBOfUVuFhTRULn5ziRV0Jhvk8mchj0euqCPAUe
	FhmDBtLAVz8Q7D0IDUZPkBdDp/cLETgZp2eBrXGuKC+Him838IAMdAg8ex8qXhACp52lQZmC
	3GMKsXomnDHm/V3qtTgxkdVQrh/6bUpBb4PKfo+0AE0v/89X+X++yv/dUIlwK5rEZQipPCeo
	tNy+KIFNFTK0fFRCWqoD/fqfh989AzfRud7+qGaEkagZAYkrJ1CjO/t4BZXIZh7gdGk7dBkp
	nNCMwkmJchJ10XWUV9A8u4dL5rh0Tvcni5FjJ+uxFW0Rri5s/buErenRr38MvrqS69/oUL3M
	2W6xp5rqV5SEj+aQvIb1he6N2SUpZIWGdWNaLlyofLIBjhcvjb36IVNon0gNF6/9snDq/lZa
	1zR7aGA9lrXaF6NHHYdjLUy4/2vyIYN7nGGNrLu2ue+5tiO+SBPnLmu55LO85rvzLEZTV+ns
	3MiuF9vtNc6E90WnquO6VMcHkgVZ1Yh5tzXTv/zajTbKm7QlM7F6yqL5npBI6el0eUFPmfl5
	WIi/qrRjhKcW9T1oM7VrotY1hl7Odvvj+7PiVnl3bLKfkll7X9qUC+xtl25uVvWMl5trDHUl
	owWFrVklkTLlwjBqpVIiJLGqSFwnsD8BQ/RJzK4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsVy+t/xe7oPOt6lGxyZI2fxYV4ru8W9S1uY
	LF7sbWSxuLxrDpvFts8tbBbrv85nsji+NtyiZf8UFgcOj02rOtk87lzbw+axeUm9R8vaY0we
	7/ddZfPo27KK0ePzJrkA9ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
	m5TUnMyy1CJ9uwS9jN6JiQUNBhUbPjQyNTB+lO9i5OSQEDCR2Ld6P1sXIxeHkMBSRolNLU0s
	EAkZiWvdL6FsYYk/17qgil4xSpzuOwuWYBMwkniwfD4riC0iECyx9NwOdhCbWWA+o8SXjSkg
	trBAuMSxo4/A4iwCqhIbD75kBLF5BewljpzoY4VYIC+x/+BZZoi4oMTJmU9YIObISzRvnc08
	gZFvFpLULCSpBYxMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKDf9uxn1t2MK589VHvECMT
	B+MhRgkOZiUR3u8J79KFeFMSK6tSi/Lji0pzUosPMZoC3TeRWUo0OR8Yf3kl8YZmBqaGJmaW
	BqaWZsZK4rxsV86nCQmkJ5akZqemFqQWwfQxcXBKNTAphps3FwQI/pd/EGnxR6hRxN7YqFJo
	yWfPz4H6LhMV3USDnTQ9BJ448u14HuuyYRLLnFc9/xb+vrxXf9bDhvsaNzQZ71eW5fvyTZKN
	buz85DpPpGdaSKnZSv6/dnaFrqcSYmdN/Kl2YtNpVcFXbkyhG+6rbdkQVrD7ok53+T0jXw0d
	ucPvihycp26YmVbyL8ztq6mYSMymjlZVrsNXbVdX1yaujT/kuKkv2NPY7KVx//pPj9xrHL9G
	rS0LPy885YrEPzmfmtc6S9sf/uf/tJU1415HNrdBxZ2SXVOWc7e/bWi43JGQLv6mR89iSmOa
	wvrfszft2a/gcve8QdD3sws+5IhM/Lb8gkZoj9WeJiWW4oxEQy3mouJEAE5N4PwHAwAA
X-CMS-MailID: 20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37
References: <CGME20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37@eucas1p1.samsung.com>

Addresses two issues in the TH1520 AON firmware protocol driver:

1. Fix a potential buffer overflow where the code used unsafe pointer
   arithmetic to access the 'mode' field through the 'resource' pointer
   with an offset. This was flagged by Smatch static checker as:
   "buffer overflow 'data' 2 <= 3"

2. Replace custom RPC_SET_BE* and RPC_GET_BE* macros with standard
   kernel endianness conversion macros (cpu_to_be16, etc.) for better
   portability and maintainability.

The functionality was re-tested with the GPU power-up sequence,
confirming the GPU powers up correctly and the driver probes
successfully.

[   12.702370] powervr ffef400000.gpu: [drm] loaded firmware
powervr/rogue_36.52.104.182_v1.fw
[   12.711043] powervr ffef400000.gpu: [drm] FW version v1.0 (build
6645434 OS)
[   12.719787] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on
minor 0

Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain/
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/firmware/thead,th1520-aon.c           |  7 +-
 .../linux/firmware/thead/thead,th1520-aon.h   | 74 -------------------
 2 files changed, 3 insertions(+), 78 deletions(-)

diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
index 38f812ac9920..b87d4e8235b1 100644
--- a/drivers/firmware/thead,th1520-aon.c
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -170,10 +170,9 @@ int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
 	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
 	hdr->size = TH1520_AON_RPC_MSG_NUM;
 
-	RPC_SET_BE16(&msg.resource, 0, rsrc);
-	RPC_SET_BE16(&msg.resource, 2,
-		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
-				 TH1520_AON_PM_PW_MODE_OFF));
+	msg.resource = cpu_to_be16(rsrc);
+	msg.mode = cpu_to_be16(power_on ? TH1520_AON_PM_PW_MODE_ON :
+					  TH1520_AON_PM_PW_MODE_OFF);
 
 	ret = th1520_aon_call_rpc(aon_chan, &msg);
 	if (ret)
diff --git a/include/linux/firmware/thead/thead,th1520-aon.h b/include/linux/firmware/thead/thead,th1520-aon.h
index dae132b66873..d81f5f6f5b90 100644
--- a/include/linux/firmware/thead/thead,th1520-aon.h
+++ b/include/linux/firmware/thead/thead,th1520-aon.h
@@ -97,80 +97,6 @@ struct th1520_aon_rpc_ack_common {
 #define RPC_GET_SVC_FLAG_ACK_TYPE(MESG) (((MESG)->svc & 0x40) >> 6)
 #define RPC_SET_SVC_FLAG_ACK_TYPE(MESG, ACK) ((MESG)->svc |= (ACK) << 6)
 
-#define RPC_SET_BE64(MESG, OFFSET, SET_DATA)                                \
-	do {                                                                \
-		u8 *data = (u8 *)(MESG);                                    \
-		u64 _offset = (OFFSET);                                     \
-		u64 _set_data = (SET_DATA);                                 \
-		data[_offset + 7] = _set_data & 0xFF;                       \
-		data[_offset + 6] = (_set_data & 0xFF00) >> 8;              \
-		data[_offset + 5] = (_set_data & 0xFF0000) >> 16;           \
-		data[_offset + 4] = (_set_data & 0xFF000000) >> 24;         \
-		data[_offset + 3] = (_set_data & 0xFF00000000) >> 32;       \
-		data[_offset + 2] = (_set_data & 0xFF0000000000) >> 40;     \
-		data[_offset + 1] = (_set_data & 0xFF000000000000) >> 48;   \
-		data[_offset + 0] = (_set_data & 0xFF00000000000000) >> 56; \
-	} while (0)
-
-#define RPC_SET_BE32(MESG, OFFSET, SET_DATA)			    \
-	do {							    \
-		u8 *data = (u8 *)(MESG);			    \
-		u64 _offset = (OFFSET);				    \
-		u64 _set_data = (SET_DATA);			    \
-		data[_offset + 3] = (_set_data) & 0xFF;		    \
-		data[_offset + 2] = (_set_data & 0xFF00) >> 8;	    \
-		data[_offset + 1] = (_set_data & 0xFF0000) >> 16;   \
-		data[_offset + 0] = (_set_data & 0xFF000000) >> 24; \
-	} while (0)
-
-#define RPC_SET_BE16(MESG, OFFSET, SET_DATA)		       \
-	do {						       \
-		u8 *data = (u8 *)(MESG);		       \
-		u64 _offset = (OFFSET);			       \
-		u64 _set_data = (SET_DATA);		       \
-		data[_offset + 1] = (_set_data) & 0xFF;	       \
-		data[_offset + 0] = (_set_data & 0xFF00) >> 8; \
-	} while (0)
-
-#define RPC_SET_U8(MESG, OFFSET, SET_DATA)	  \
-	do {					  \
-		u8 *data = (u8 *)(MESG);	  \
-		data[OFFSET] = (SET_DATA) & 0xFF; \
-	} while (0)
-
-#define RPC_GET_BE64(MESG, OFFSET, PTR)                                      \
-	do {                                                                 \
-		u8 *data = (u8 *)(MESG);                                     \
-		u64 _offset = (OFFSET);                                      \
-		*(u32 *)(PTR) =                                              \
-			(data[_offset + 7] | data[_offset + 6] << 8 |        \
-			 data[_offset + 5] << 16 | data[_offset + 4] << 24 | \
-			 data[_offset + 3] << 32 | data[_offset + 2] << 40 | \
-			 data[_offset + 1] << 48 | data[_offset + 0] << 56); \
-	} while (0)
-
-#define RPC_GET_BE32(MESG, OFFSET, PTR)                                      \
-	do {                                                                 \
-		u8 *data = (u8 *)(MESG);                                     \
-		u64 _offset = (OFFSET);                                      \
-		*(u32 *)(PTR) =                                              \
-			(data[_offset + 3] | data[_offset + 2] << 8 |        \
-			 data[_offset + 1] << 16 | data[_offset + 0] << 24); \
-	} while (0)
-
-#define RPC_GET_BE16(MESG, OFFSET, PTR)                                       \
-	do {                                                                  \
-		u8 *data = (u8 *)(MESG);                                      \
-		u64 _offset = (OFFSET);                                       \
-		*(u16 *)(PTR) = (data[_offset + 1] | data[_offset + 0] << 8); \
-	} while (0)
-
-#define RPC_GET_U8(MESG, OFFSET, PTR)          \
-	do {                                   \
-		u8 *data = (u8 *)(MESG);       \
-		*(u8 *)(PTR) = (data[OFFSET]); \
-	} while (0)
-
 /*
  * Defines for SC PM Power Mode
  */
-- 
2.34.1

