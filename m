Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC071E2858
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898735; cv=none; b=RFyrawVHXUIuFt4pAQ1An3rj4tN7OWZ7WNSEGB9KiL9fJzi9wVgN9RMAGXETUJpz+YedmIcxa+d0/qeRlyzduMcYL3MusX/3ATj8Il3dxiHd17vm6Ow9semQcdo+Tv/xCio0wpErD7D+jaIiqTEV7q0RGvZvKuVDIYsTJO5vWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898735; c=relaxed/simple;
	bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=eNyvl9DaWyZqbJurNLRzT682I3jzWiQ68KiR7A5EFNVU53pe9ekPtnIhspmAY29/3B065pUyoPuS4hvkh214PZg36MYY0lY/IBjIResg30NAMl/fYAEe3QE0oMj95bnnJFrHd7GdaPmo1anKKbEFJUBp4XYgepJxo3I53MHnQZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=mqSOZKTs; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="mqSOZKTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=; b=mqSOZKT
	sOCLEoeV9m2aNNl7ZYnnPTzxgCKOLinUqnpjcjQu6gfZM/UphfTO9EOkGFBqa3+E
	YRTigz5KXLJQBIIDd1mAowQnKgp3qt/4w+RPGmLL00fktcvPKSO65GQtkbrEfa20
	aYGA0A3Z6ZIfa9cJiO7hAAhK/gbEC7SmtxqI=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3l2og_sNnPh4JBg--.59684S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Java
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PykvCgD3l2og_sNnPh4JBg--.59684S2
Message-Id:<67C3FE20.0D9048.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDPxhDUUUU
Date: Sun, 2 Mar 2025 14:58:51 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhUEumfD7erXgwABsj

Hello! Rust is better than Java

