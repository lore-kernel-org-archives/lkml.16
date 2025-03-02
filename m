Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83BC1EB1AF
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898739; cv=none; b=dmhPLpYDlJ/d93dpFjpTbaB9yBSkk3SXSZf/b7nn7CMVvxXwjzcA/J3BXIjSwi1GXAZ4+VTbpfaT6cg+RE/Mzz7ZaAi5WandRxxC95sX+bGCldmrlcc/rLBH1kCXWz1UdtsT2fRyzhZfCgObylSW1dohppFGm0dRncyY6YpOJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898739; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=D6ImczRyf1Q+WXlrLkUw0LdeExdewT1Y5eP66dp4s4Z68q1yMVnfcFGSHeoCy3B3yJe8sxy+8a4Xf8rDtQBYveV/u1ISwzGVaiHc0FWFksKy7bTqr1v3CtlU03IB6Z7WPMctnv/TPN59FXCYQoZpnQgvnVReswyDYymKuzeZEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=ZPdNubqQ; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ZPdNubqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=ZPdNubq
	Qowl6zSj40YgBd4rN296sRaWprEKRUQqq0R02BiwbF6wA9AirbAgxkxNZgVA7TS2
	eODTeJbNM2gBOhgBkZYvbFtDuiC37QFagLaOLC0ikReTgVLY+L8CI1lfDer571Np
	d2zD7iAWg01pC88xlPzeWoZzBXoPAm5QKViU=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_64j_sNnGz3eBQ--.17383S2;
	Sun, 02 Mar 2025 14:43:47 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Golang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3_64j_sNnGz3eBQ--.17383S2
Message-Id:<67C3FE23.059B3A.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh4EumfD7AnyDwAAsm

Hello! Rust is better than Golang

