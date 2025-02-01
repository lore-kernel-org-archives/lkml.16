Received: from mail.pissmail.com (mail.pissmail.com [173.249.47.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483611A270
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.47.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738478692; cv=none; b=uCXeaR8MYba15ZbFi9bTZRMh4DrRyvucRYCrdr2+zIQys1mjowyd73jtHP8aMkUAx4OXiQPiThQ2FbJTHxBF4If7FXaOIzpxDbqgY48mJYX5Xhr3vDP9hQ8pMyJa+6oVR3Ifd3B7dIbdGQCSaHohl9Gh35qjN6sQzb3EIiEcHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738478692; c=relaxed/simple;
	bh=f5DS6xRxGYftTXI7YUz+QrL5pHVSCTf56TiUu9awbEE=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=DBatrytbnYIh43HgFfMeJIdNJfdc6jr5nfqHZDFxhwoN6jWtdh8iCeNo053F3Ywv80TxtDIRaP2e8nucsIIMTQNuPtpQdX0JTd4CXvKCgq+tKTgnKdbvC6QO4qS5T1dKqn342I6lkJBr0RKyOkQVbDMhhjspDxvaZIJr85R5XJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pissmail.com; spf=pass smtp.mailfrom=pissmail.com; dkim=pass (2048-bit key) header.d=pissmail.com header.i=@pissmail.com header.b=gts6I+aN; arc=none smtp.client-ip=173.249.47.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pissmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pissmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pissmail.com header.i=@pissmail.com header.b="gts6I+aN"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pissmail.com;
	s=dkim; t=1738396187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EKIl41mysEtb8SifkvoXTvCM29anATIsLrImsxTqT3g=;
	b=gts6I+aN4taUgk7tzDkoSyoE5fXQ73bEPv8C1E55hSveet7OCHWxCaxa2hV2iNbEut6fMw
	eHtuQsB/4kawFqwQPWQFkSwkY5XNeJj8OZZd9lSsGu/cf3GQS3GygI2MY1U5jWjwJSNIoR
	qd3k9Y4X2eSjoytOJTGbSxfdK1r5x6Psmi44gtAE6J6vLojKjYa3FXCx1MUX7f4NpBY1CX
	3PAPhq9JsfXSql7NZBjrBJERACdMyd346Ye6D6ljZJMSNKsNbQ2PkHaJO2CWtPUTLzLnol
	bJ0ftyq0MHucNvBn+tynZ+qTamdbXAqNR/aIcnh+6iR3IF0HcJc6XTAx140+2Q==
Date: Sat, 01 Feb 2025 07:49:47 +0000
From: mortodinoite@pissmail.com
To: linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Rename GTK+ to GTK
Message-ID: <fd3be9e6b898bde7b8c9a6b7e51e2b4b@pissmail.com>
X-Sender: mortodinoite@pissmail.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /
Authentication-Results: mail.pissmail.com;
	auth=pass smtp.mailfrom=mortodinoite@pissmail.com

Hi,

I would like to suggest replacing GTK+ with "GTK" here: [1] [2] [3]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/README.rst#n168
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/translations/zh_CN/admin-guide/README.rst#n149
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/translations/zh_TW/admin-guide/README.rst

Upstream calls it "GTK" nowadays: 
https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.html
