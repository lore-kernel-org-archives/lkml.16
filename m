Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD961E9B12
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321338; cv=none; b=HICOTrhuBKChEcrXpoct7bk1N5GTYASm/pQTUcMHZu09Ga5HrDRXQVIdT9WbjwG4bGy0WrTaUlrFOtIC3UG2FaioJBpoopE3EnmFMRNtatL5fInHluVPol6LRDcxKk8OmV4b3I/T5brHefdlipfS8fIaU10X9qwRJaLBbIs623I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321338; c=relaxed/simple;
	bh=sVfmzWOzDZAhbxH5VP7xRE284ckO6X9kvK3+wsxnjmg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=FZTqxUufDDrduH3CycoIc6d3jww/JuPxORjofV9UUWU/X5gSiy+5FbPWOv7wYey8NVXhuW6IWHSnA2eQiUAnq7NaFeLv3R/5xHqWfXVIEqCnBcqy5ENIL5xLDO7D0Au5po1st+uKPqK8tpwLsgsBnUt16joYVjGfHv+yPLa5dcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=QR+PSjVI; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="QR+PSjVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745321330;
	bh=b9BF6J4/cmSFjASHfolLJ759/kmxLru/vOd1NEsZVN8=;
	h=From:To:Cc:Subject:Date;
	b=QR+PSjVIl7ETZyRhU8iAkRGE/Xfsad/r6rr4tOps37+gYJ4cA+2fqTQD8dNZAgBKp
	 EZXZMoi9pSJzHQ+fF/RBpSIidmX81NJOoLQA9O8qMg98nbxu4WWUOytAVirYF0n8Bs
	 /1katJdvSvytSZoN3D/x4GHGSZwcmxoHQd62mOTw=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 73102851; Tue, 22 Apr 2025 19:28:49 +0800
X-QQ-mid: xmsmtpt1745321329to0rljxuo
Message-ID: <tencent_AB44A8723B522941A2792D9C58CDD9B8B60A@qq.com>
X-QQ-XMAILINFO: OcCvshEzgS0QYFlZ9QyfT5Gp3MiIsEaN1eG/pxU1lrAMATT+ROuP5Ena6uZ6Ur
	 DvrIZFs5Y0HIEFGZ7bLEgBPq85TBIJXoMu/fM7Y8L2eEXlxJ1hlOYWdtT20YjCIK6Q8OhCIQ540i
	 CY05fSOldwto9JqsNLx39Rmxhb4xcPJnNmMJEz7HTT15X1BSW0b4p18H6ZUbiboCJRkJ6jE2Yqrq
	 NSwiv9NkLW1hnl7DjhaOH1omHn+RIcT5/HCJZXoN+WfKOlsAPsr9oLGTu9+36grtc9JzbXZ6IJ7c
	 cTzjK83oOWPjwpD17HthCiIdBARIcTzrGMn+hmht+l9yxiAzyaSChPxJKrtqtCn44jLiyJx7wldi
	 lo9Hs8+bCbARnHHTNaZORPFXGQWnNxoFkMcjIQLNCqSqRFeEGUDdmJ2I5ccU31u1MSc9MQxXiNHc
	 K6skI2iZjeto2eXCFqUgOagWdwiNOWYSPvQ8mHlGYlXXCUbn6Xwi9cJOfQfew/viTXfZ9+vm+uIR
	 jaPHozr1xvMWIkjzKTG5jM45P2Q785LPXHd8MzXHHbd7EoiY+SaZlriQcR03NI9fHHYgewu+XFQ7
	 p1B1TdH4nnt/r0ZTVQyopMTc962NMSnrNAZnKzsAMVwWcJH0ZgVRSwRK6bPpUFfDB6hbUHOFComK
	 Nx1se6iP2gWFE3KpVqk1hofLjsocNNy2DkZXGY0Ld6PVpytCT2gdJFINFsuwAWCeG8RY7QAPuHxy
	 fs+t3aJjOiwvWi//JcGtg0m/4Yu34LtNtpDRpcVyo4k50/QViZxM8QQmPUW2SXPDOM1VeOcNpgVw
	 QIcoVHRJpOMn7K2RHsBg74lUHvVIP3E3LLHdPeQON29irA+lp5dKr6mlo2Tx96kTqY2U+hLrlv+5
	 kCmFLgI3gQSR+HD+hepXshX5OJI1aZH+2a23vlz0ivO6TbpgRhSg45Itf+uZCMhOn6F/E86vhXgt
	 xPdCxVxpLnE+4vlHzPrh8D0liL+Pjk
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: xiaopeitux@foxmail.com
To: andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	john.g.garry@oracle.com,
	robh@kernel.org,
	xuwei5@hisilicon.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/3 V2] logic_pio: clean hisi_lpc and logic_pio
Date: Tue, 22 Apr 2025 19:28:47 +0800
X-OQ-MSGID: <cover.1745320689.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

1.remove unused head file.
2.add comments for logic_pio.
3.export logic_pio function.

Pei Xiao (3):
  bus: hisi_lpc: remove unused head file in hisi_lpc.c
  lib: logic_pio: export function symbol in logic_pio
  lib: logic_pio: Add detailed comments for find_io_range() and
    logic_pio_trans_cpuaddr()

 drivers/bus/hisi_lpc.c |  3 ---
 lib/logic_pio.c        | 24 +++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.25.1

