Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB3E1EE010
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=Nk8DWiZbpCF5rhIfSIaXzGnWfnbPI13wRhd/ssl7hoL5ncDuYuE9S2Cd4j7AiivOMjaQtXn8T22DXo0HUPLmJhBarWFMmSenJCEOaZytJIsN400M7QZ7fDzGq+NYUIma90HUIp/iH3bq6DqGjOlxn+YNK3QMUIY5rNf//IpSfcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=bnl8HCFB2QsvuQ0S1SZADA1tLCjhGrOia8lKmnMDue7NL9Dpk5LoOpcRWfDkfkBXGyd52WivLGWuazNojTnNhpZhQRAF4mBx44I6oFVSdNl3Ufhqz9LlKgcSNMH4XFFAWhaH/T+T8S4sTSKg4wpfydG6UFc7lHiXHM8ygZanq+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=UEpOcPZ9; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="UEpOcPZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=UEpOcPZ
	98Cb9q4ovoRfGRB1u58IKAdmyMaFF5f3j82hA1eWbC9V5w2SvNWDP2eQwxyr5pnW
	NMWCIpokCCOYcubWG2qXVS+lZ6CoTsoaLBCbx55vBPvlTslsQQKoc59wlb7i0imw
	wkdwl7LXplqkiz7qNULG/xoeDRmT1v1swxsE=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3_2Ug_sNnHx4JBg--.58627S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C++
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PykvCgD3_2Ug_sNnHx4JBg--.58627S2
Message-Id:<67C3FE20.0D9045.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUToUqUUUUU
Date: Sun, 2 Mar 2025 14:58:56 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhQEumfD7erXewABsa

Hello! Rust is better than C++

