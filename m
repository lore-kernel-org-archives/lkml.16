Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1F32135CE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153545; cv=none; b=XSF2B5m2uCy7xyClNE5xdXNXZyqU+JV87koAZi6dg807sz030gtIdp03GvCwQBKHCt8P39ZOChtHqhTHakKLgkfKz5fUhBue47DuuuS4Z36svp6pI1oHHwcsb3bAmtI9YRjvD8wW2IlNuSmBQPPQbuXPwUeHmhhWJ0KMbXwoxJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153545; c=relaxed/simple;
	bh=1JlOzkLmqYWnLlGehwecqpC4uZ0U+sKtPyTOjaX2WFw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EFGcSg3JsJs5Y5z3eAUB8cDNUSc0gaMMTGRUbRbix50OWFdbjoXEpCHOquo5Fq7OKZi8Qi14EgUDNu95LADrMFOGlznadDbo45ItsOXgV3k/toyhlw/934MBbTGDqaErNsXd+s2aM8GEzwyON2mtOzP/0CDUerLorCsm1+wzZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso69266235ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153543; x=1750758343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bEHA2qX/oVaaMcpR/YbNSPA/WmlhQAFoeNLoNBQEF4=;
        b=S7wHn5W9Ejjmq92B0mlXHXqdQgmXDVOEh7VdPneEIZW9fPiEMEuqmhqj8VHNFEnDP2
         GcHphhORv3kawL2ciuAUQD0xT7RpBSoN0ersGRkxWaUktGQUrpKxshQjdcMhK20mQBpa
         9yloPVj0SlRsEGt4X/SvY80/HjGudRMWQq6nZeCGMPkRdfWGr6LPkhSUQYQPlaykjERT
         FDzoUd9VjBKDZrBxpvcX1VIbKhqqg8+5Ty0jCkZH48eFqK1gPwY19C9tyEDfiEAvjyHN
         bjF0vs/mlRG51CbipNIvmrbtkGAvxb+org+UN8mm/mRQ+FFvLztei255jqPovcWUNFbP
         K5LA==
X-Gm-Message-State: AOJu0YzEgAl73Tdy2owYjZ8NfVdtxpo55vOgaTzyCHmT0VJ6TsvzqhqO
	8sfLxraJf7lbAUfK1eUMya3HS+/lhv0KqaRl4s3yU+GgdBYiOCe96bui1LZiZl6rSD/kBfBWu6N
	8l9zMdGXIngBsOix/WLysjOs7ofecIrbOMKGwP1MkLQUgP8REk5QKxbWUzyE=
X-Google-Smtp-Source: AGHT+IGn4GRfWAWyngxTTGQBJGcaRnD1dz+v41puZb8KTD+fWnJZfLelx9tJZyNPlggAVJrjE4su5ABXpRyLQ+VU78Ol1X2N8n/C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2583:b0:3dd:d18c:126f with SMTP id
 e9e14a558f8ab-3de07d50c73mr127290935ab.10.1750153543491; Tue, 17 Jun 2025
 02:45:43 -0700 (PDT)
Date: Tue, 17 Jun 2025 02:45:43 -0700
In-Reply-To: <00000000000096ee8f061e991433@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68513947.a70a0220.395abc.0210.GAE@google.com>
Subject: Re: [syzbot] [PATCH wireless] wifi: ath6kl: remove WARN on bad
 firmware input
From: syzbot <syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH wireless] wifi: ath6kl: remove WARN on bad firmware input
Author: johannes@sipsolutions.net

From: Johannes Berg <johannes.berg@intel.com>

If the firmware gives bad input, that's nothing to do with
the driver's stack at this point etc., so the WARN_ON()
doesn't add any value. Additionally, this is one of the
top syzbot reports now. Just print a message, and as an
added bonus, print the sizes too.

Reported-by: syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
#syz test
---
 drivers/net/wireless/ath/ath6kl/bmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath6kl/bmi.c b/drivers/net/wireless/ath/ath6kl/bmi.c
index af98e871199d..5a9e93fd1ef4 100644
--- a/drivers/net/wireless/ath/ath6kl/bmi.c
+++ b/drivers/net/wireless/ath/ath6kl/bmi.c
@@ -87,7 +87,9 @@ int ath6kl_bmi_get_target_info(struct ath6kl *ar,
 		 * We need to do some backwards compatibility to make this work.
 		 */
 		if (le32_to_cpu(targ_info->byte_count) != sizeof(*targ_info)) {
-			WARN_ON(1);
+			ath6kl_err("mismatched byte count %d vs. expected %zd\n",
+				   le32_to_cpu(targ_info->byte_count),
+				   sizeof(*targ_info));
 			return -EINVAL;
 		}
 
-- 
2.49.0

