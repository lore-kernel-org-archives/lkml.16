Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E701D1D6195
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897868; cv=none; b=ruSs5bMACzZByzsACO8EjZ4v3AMqk+GIWVHigbDl3F4y9WrEC6eNlzDEp7WYJ4Ke0V9RQ8MnnwMNY88C0hwRAUT8pN73+TMTrkEYOJJkiptkd146NmkKECo2EtSCtIZmzTqcIjgVylVX3G1jQrYkwiLnD5j+pyicnj9IBaYn3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897868; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=qqOZGlgNGhE5dbIKEJHN8rMdxFPlWU/tpues55zevQ3BPEUQU6ZHDqaKqdadehXnHKC8PpXJ9axwzHgC6NAZODHKs7Ad+zNit3/8vYYjznaHRmi7UfDgN9N4u6X6iMEFafGJLnMa1V+ISNXKN0MpAsDEZVKIvWY6+1t0VWMskc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Da7FGqmM; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Da7FGqmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=Da7FGqm
	MV6/Pk5SCCNnVk9wlVm/NGJkTUIaRwvRYmVHyUGs7xT5rXTOjk6FxjgOY0KCeeNr
	UGGavkwAXX0KWWICIc8ZATi50AE/ybd8hoyLy9d3+5Jik2NSzxTMbZx9RFOQ7FDK
	5FQ5xZMSsfv4iY9nK+HAyOVA9FaWDkToW8Vk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXX3tF_sNnoP2xBg--.27027S2;
	Sun, 02 Mar 2025 14:44:22 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDXX3tF_sNnoP2xBg--.27027S2
Message-Id:<67C3FE46.071823.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:22 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOg4EumfD7Anz3QACsn

Hello! Rust is better than C

