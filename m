Received: from outbound.pv.icloud.com (p-west1-cluster2-host8-snip4-10.eps.apple.com [57.103.64.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C425D902
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859621; cv=none; b=Wc6BIg3L7BLhOCuQH1wAJ2btofexUUaf+/PR5kn/ENC0zF2OMvL2UPYbHdsWsaipm86BXLGpGxWrxGSmxpiRgC6ol8483cffpmPPlFpwyNUrAHv4txGvKwsejZdKCPlPD3LOKOphgyKnAubZWRVu6IWaZTs8fEN0O5YhWmq92U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859621; c=relaxed/simple;
	bh=U45EqJF6YN6tekyrx9s1ZEvUckFcUd/J7k4ck0IzDpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cKKTfAoqk1RU34c7swUZeOEnDzZLiCrSxLJyDshEUnM1YkVDmXg2WcfO8x4ly0C7vPsB5i46rHTKwlWP9hGxGKoQg/YhUpnctSzzKGczG35YxBM1tuoC5fi5VVTO14drMvGDG6xHzd3oWNXzaJKw+fOhmRFo7ra9kkIm/jDE0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=0VWrL9kR; arc=none smtp.client-ip=57.103.64.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="0VWrL9kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=BVvTwkeA4Efv9m9fgcy8GIiLHjUL10neQHMJfQiFe0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=0VWrL9kRSqRjoLQr3/wAvnOaKPv9BiNgP9XRRRfSoKGyV/gCR8d/1mVvHslIwhACO
	 27I3tGZYBVxjXmKEE8VR6ZS+sTFn3j07xFfx7gt4yg5SxuIC4iaCdjg4VxsMhFVJBW
	 JQ8arq7xgKYJoxyyVN1627L7+pzkSfMKmfbIAdIXl17E7PF8isEQc2KrLzhvYtXm8h
	 uXiWLxRX842aFPwz3JeRlgVO1ebW3IDKZZCIjdgqlI/g4F5M+BdMc8Kd9jSxguqW0K
	 xQDF5iuMfQrS9k5IB3Klnn6QAk1MhdY5DVetwTm+WH86SDEjMx+ZLsizlMOafnStl3
	 oL1C/YuXPBfKQ==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 3F0B91800394;
	Wed, 25 Jun 2025 13:53:35 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id C36C01800387;
	Wed, 25 Jun 2025 13:53:33 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 25 Jun 2025 21:53:20 +0800
Subject: [PATCH v2] char: misc: Rename a local variable in misc_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-fix_mischar-v2-1-25a80f41b090@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE//W2gC/22MzQrCMBCEX6Xs2ZRkaVriyfeQIv1J7YJpNKtFK
 Xl31569DHwzzLcB+0Se4VhskPxKTHERwEMBw9wtV69oFAbUaHWNWk30vgRiGZNqXDX6Cq2zDkE
 e9+Rl3m3nVngmfsb02eWr+bX/PatRWtUDNqbu+8lM3Skyl49XdxtiCKUEtDnnL/yXw+KtAAAA
X-Change-ID: 20250620-fix_mischar-794de4259592
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: WAHlQSOgQtKH222FTvr0JwCcyVwGTHp3
X-Proofpoint-ORIG-GUID: WAHlQSOgQtKH222FTvr0JwCcyVwGTHp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfXyzFc1+izvQjP
 2jyUZqVjB/97UhG3mi2NLKnxDRMtECqstgK023ho3XeQjfbca/+JKjeu0KUpjpCpYTHBssDBYYy
 LJkBDJfLUlxbq/QJnUJ9Io1q+dAaTSNzfAUWrEL1Xc3LssqTnKtn/Mcrv5kUhbuoa+5VZRr/GTk
 3AJxZ8Sjxj9iwjdtmcwKfJzYpT4/20+xZDa0PJvP8Oy/9DSbSywh5SdGyO1E1QYm4TKsEY4b6ju
 q72WM+zylDqKQe+f9XgmjFz7Z5gC1BczwKjyTuVutca7WxmfjQT3Z1SA9Q26Gi/TT7z7uFa70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2506250101

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Local variable @ret is not used for return value in misc_init().

Give it a different name @misc_proc_file.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
This patch series is to do trivial cleanup for miscdevice driver.
---
Changes in v2:
- Drop applied patches
- Rename the local variable name to @misc_proc_file based on Greg's suggestion.
- Link to v1: https://lore.kernel.org/r/20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com
---
 drivers/char/misc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 5247d0ec0f4c5363d5ecd2881741510158295779..558302a64dd908aee30341547a5413df1af71459 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -289,9 +289,9 @@ EXPORT_SYMBOL(misc_deregister);
 static int __init misc_init(void)
 {
 	int err;
-	struct proc_dir_entry *ret;
+	struct proc_dir_entry *misc_proc_file;
 
-	ret = proc_create_seq("misc", 0, NULL, &misc_seq_ops);
+	misc_proc_file = proc_create_seq("misc", 0, NULL, &misc_seq_ops);
 	err = class_register(&misc_class);
 	if (err)
 		goto fail_remove;
@@ -305,7 +305,7 @@ static int __init misc_init(void)
 	pr_err("unable to get major %d for misc devices\n", MISC_MAJOR);
 	class_unregister(&misc_class);
 fail_remove:
-	if (ret)
+	if (misc_proc_file)
 		remove_proc_entry("misc", NULL);
 	return err;
 }

---
base-commit: 421d3a860d3d795b816d3efbcc3c2001c1ee1325
change-id: 20250620-fix_mischar-794de4259592

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>

