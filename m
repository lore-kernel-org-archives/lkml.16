Received: from mail.fastemail60.com (mail.fastemail60.com [102.222.20.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C61293442
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=102.222.20.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799903; cv=none; b=dXOPBUbUTskJDKcvMAirxMQ/TrL4rGtdGMWjL1cpSf4VkoM7XGABu5BAAsiifAWLfdgWgHvOah+UMFRIvUPMX36OFVuEMHUaMnTDTnbl1en2DX+Ik0aNFbwugIBljybvL8LXzByIVGVk26jRe5LEA6oj9QxizQRN3k5FrvWdk5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799903; c=relaxed/simple;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PAmce4N4L31O5hjGV5G1y+gj1C+q2h0wuoUUgT3cWUq5b3HRE8m6z7F/qmnjL+ABBszw/CISwXIQxEdAZFOQVf5Bl6T6/KD3KugOohPfh6btq8FJ8l/Z+FU7WtjnlslaebbGAVYm2XZjVWB/iBKZmSHkpaSNGKQd4GuB/AngCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com; spf=none smtp.mailfrom=fastemail60.com; dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b=Ip7OBqZt; arc=none smtp.client-ip=102.222.20.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b="Ip7OBqZt"
Received: from fastemail60.com (unknown [194.156.79.202])
	by mail.fastemail60.com (Postfix) with ESMTPA id 3049F87C08C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:55:35 +0200 (SAST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.fastemail60.com 3049F87C08C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastemail60.com;
	s=202501; t=1746798937;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=Reply-To:From:To:Subject:Date:From;
	b=Ip7OBqZtps9qWbr9RDlqahMxCZNKur3qZmnmjfCGhVUhlYrqKnLERF9BOnbsmWLnC
	 GCIGXVCKkGtRrTXCQEXdbX6YpqpLZj7iBs9EtS89fxm3xUxZ4WiPvCdD8n5gfP+9rS
	 XThn9CoYTV2o8Il2S0MJU5cGJqSsY8keBN5v/TXuYeVkOMYYveCJgR3xJaQKvv/uK+
	 29PtDiMD6FpCBTbxOnNn4MTR83vome0AzoCxg2qksaaW3R4igDLamj9+mlfQtLju4H
	 468nbgU1UqokQIAzT7mLd9EmjgQkv1LLGKj7QafGG/8JEkZezfM3j5eb7bsDee6SgD
	 1mt34gFghV2sQ==
Reply-To: import@herragontradegroup.cz
From: Philip Burchett<info@fastemail60.com>
To: linux-kernel@vger.kernel.org
Subject: Inquiry
Date: 09 May 2025 09:55:34 -0400
Message-ID: <20250509095533.462980A0042B9D67@fastemail60.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.fastemail60.com [0.0.0.0]); Fri, 09 May 2025 15:55:37 +0200 (SAST)

Greetings, Supplier.

Please give us your most recent catalog; we would want to order=20
from you.

I look forward to your feedback.


Philip Burchett
