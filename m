Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A127E7EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892033; cv=none; b=EUgoTar05Ln9JomIf3sPsPMDJ203+t1usA5IXYE6TEtyg+uK8GhY3TLBhetCVgciBckhZkoRRjUXKNX2/0Dn1SFfeXj7Upf9TxTLJHmmpem1ntZ2FReNi9F9lWx+9bKymOpMuTBkfb2m/gOI8pai+o3WCT/LFfXR0ez448SqiNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892033; c=relaxed/simple;
	bh=un1KzIcCLoFSGmy5GpOTWpUrd2qcMQ6HqFUVcK60F3w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=XBwPuOsFJp7JewiOXM0r9LGId94y0hePtpZLqJBi9Zyul5JHYW92OoaJp802aJDNsDErulFzU5pS1xU65VXdSqdWoDMK33fQ1ifdHG+PiPOtIi8hRxwt4Ymz9qv8/USVschBJQCCa+ygj+tmaMJYw/vclFrJeSIcWnbq71OSxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZIOlGDGv; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZIOlGDGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751892003; bh=I8l4B2hWkaNMJw4Bk4rAJUrT5N0hOuwZtEGcUqjIsOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZIOlGDGvOD6zkAAleeLKUM5Um82Rf5W5m43AWZD6X+dhrRQssXkn/G019FzBIX1d3
	 Zdgu72V8HZyyZEzAiqOmUt6YGFLl++neXA1CcZFDlSUKhKerQtI9m4lschN5EsdLL2
	 BsZlkW//cHGTZmstPb9XH/NVvzNmtpz6O8Prbs38=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza28-0.qq.com (NewEsmtp) with SMTP
	id A018E217; Mon, 07 Jul 2025 20:40:01 +0800
X-QQ-mid: xmsmtpt1751892001tk67ymvsl
Message-ID: <tencent_3C66983CC1369E962436264A50759176BF09@qq.com>
X-QQ-XMAILINFO: MxdSvGmuhzbKb4fz9WSeG29BPUscsZ71s6/FjueX6viFynOYn0/ei5DlwWyCYB
	 KIvix058yWyJ14hgWSaJZFSxpidncS27Y7wCE4uZ8CwriTik7lsgTiNcbfyKIKW6ggUT1hLzkHju
	 qNiBvuYONTXSMN/d9jf1sUKJZHrRPr+Pcx5RpU1gvl+jSaQbBXmYGe5kbn7+Z9RdYcm8O2d3QC8f
	 0DHgbeU8SiudAYQiGGVsS9EL1VyUOahWc9PtIWd9guCGhUaXNxdfWhkSeJj5cxLTOA+5YjFsUlY1
	 c7awL+XGP/6bGE4Zqm05xcFOWPvAq3PzjacWMxRmYZUSmZCgrAOO9E9KeaovG+lb0c3BcezdpP7J
	 vdlpmnMxZIPBKORWpkr/p1qCpFZ06GUUctmxO44yDzWfO6KV+nhJq9pDKk8Nwp0f5j2fvrvrao0h
	 4dnTHaQ/spB+jPJBtvXU6jUcmUY48rBiGwTIyvI28rEEfgsJ7di4XbnQfWr4o+vsVQbVidfvJXJF
	 12EEtDmCTEjex/SlE6g9dGCrtsNNbN4yPrmBQGKV0RJhL8FdXukwu8IJZ/PHpvghNhyCT2yXeDs0
	 3IiG6aj1HHPk74HpTpSIFUu6zS6pLD7/hBHoEf03bIe3HhzIo6E09p6pTpL2l3VymOQ8AtKDIRre
	 eSNzM3UgT48+nEOJKaOfGnG25FUXxh23Vv9dX2z0BaqgaE7pEHHcjwRD0yptakhygN3HN5nAsVE4
	 1O16VSiOTZsslNJqDEpWFBmarFTYJ7kjvPWsKPEwjmxJ5DaYkRysCLZWXjwdV+6biXwkQINKzz9z
	 //gRvez6w1QvaDQ1hZizTPa8azsXedLxxXQQ73Qo/cRZklLtPmqCej3O5aB6knFgeuOPhNirfJX/
	 sz9+z3CQ0utoWmteXvUk9flvKii6rLdOesU6Py3XGJ5KngCST2nO/Ou8+9Pp3OQWp9QL7kc3Jh09
	 bFmfzFJRaDTMHyjvQdWNPH+nrQsJ16iPOwoiwNGSaSjmtDg5Bpt4mj+fSsYpYBdHokcVOsXgoWX6
	 0X2GltbvIX1MWyYFg/uWQajlFGz/HWoqTV+CarXg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: abbotti@mev.co.uk
Cc: eadavis@qq.com,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V3] comedi: pcl726: Prevent invalid irq number
Date: Mon,  7 Jul 2025 20:39:58 +0800
X-OQ-MSGID: <20250707123957.3616765-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <35b9fc97-03d9-4e01-a8d6-b8a061f51619@mev.co.uk>
References: <35b9fc97-03d9-4e01-a8d6-b8a061f51619@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reproducer passed in an irq number(0x80008000) that was too large,
which triggered the oob.

Added an interrupt number check to prevent users from passing in an irq
number that was too large.

If `it->options[1]` is 31, then `1 << it->options[1]` is still invalid
because it shifts a 1-bit into the sign bit (which is UB in C).
Possible solutions include reducing the upper bound on the
`it->options[1]` value to 30 or lower, or using `1U << it->options[1]`.

The old code would just not attempt to request the IRQ if the
`options[1]` value were invalid.  And it would still configure the
device without interrupts even if the call to `request_irq` returned an
error.  So it would be better to combine this test with the test below.

Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt support code")
Cc: <stable@vger.kernel.org> # 5.13+
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
---
V1 -> V2: combine test with old test
V2 -> V3: fix misspelled

 drivers/comedi/drivers/pcl726.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
index 0430630e6ebb..b542896fa0e4 100644
--- a/drivers/comedi/drivers/pcl726.c
+++ b/drivers/comedi/drivers/pcl726.c
@@ -328,7 +328,8 @@ static int pcl726_attach(struct comedi_device *dev,
 	 * Hook up the external trigger source interrupt only if the
 	 * user config option is valid and the board supports interrupts.
 	 */
-	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
+	if (it->options[1] > 0 && it->options[1] < 16 &&
+	    (board->irq_mask & (1U << it->options[1]))) {
 		ret = request_irq(it->options[1], pcl726_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0) {
-- 
2.43.0

