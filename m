Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22B21F099A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833056; cv=none; b=qj2ClZEic5+hgHpbPbGpr/zqG0BLxB2fDutqXw5ShXdg0qVQNuO9olXa+ZnYgHaeVuiRC1/mt6GrjLbGnCBVYDdoKiJ7k5EpgdmgC1yFJa6cqYCbD795erUDGxZDkyrDA3zoqkJTBBV8Zv1Vdcn1LZ5fk7Sx5JbnxLV/s8rrUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833056; c=relaxed/simple;
	bh=EnKIThmAo0bW7gvaApKBZAWi+sP7OAlrWoIPryIlUAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EEVw3jM65SoMcf18Wo5EeHvOnDy81BxQlie71LcElKFG+RqSfULXadwuaSiVFm9Gv3XhlJRDU/3MMQZK/ckkN2JUrxbNzsZntv+BkovGsBgxDBTCSMSbi8d5M/aSf8asFA5G+aNsfC6Z9m7lo29q5SeuBTFhW7rlgSh5mKEix7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Q2Rw4V39; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=ApJTxZxl; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Q2Rw4V39";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="ApJTxZxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750832985; x=1751437785;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=EnKIThmAo0bW7gvaApKBZAWi+sP7OAlrWoIPryIlUAk=;
	b=Q2Rw4V39fRnN4EOFwJ+kAx4h7LsN20lHrb0lrXQUvluVliO/b7mqUL8/7j7i1zm0T/1Niq4t3HV/f
	 vIEvD6Mu7lnNIhk0uorGU+f7QOunQ7P9aHhwqc+bbByuj9op0ndEeq8Y7VRb/C4c0DBP/VMAKO0VDc
	 /B+Pw84PwO6rfZeP4prqmh/Ng+7aoC2r01P9mohywHDBIHFcubwez9mpzF0z7Ltx4APh4CP3JRhAhz
	 F1iJxHjafFhY9HXtEgaPdo7FTXjVE5mJMy5GQBO+pN2joUXFdORhFO7YZF3WjgFVvy+DEOd7kkleKy
	 5kIQlaRpAngnsmgPI8c7LupgoAg8taQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750832985; x=1751437785;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=EnKIThmAo0bW7gvaApKBZAWi+sP7OAlrWoIPryIlUAk=;
	b=ApJTxZxlJ4ZKkyoUUJMRSi+2x1fEU+4Cy8oVBwLgArAD3q+vtBUt1MXq8h/2V1is4RUxSWgTy8Swh
	 7hjhmkOAA==
X-HalOne-ID: c7120d26-518d-11f0-b7ce-2b8368a4d5c5
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id c7120d26-518d-11f0-b7ce-2b8368a4d5c5;
	Wed, 25 Jun 2025 06:29:44 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v3 0/2] support large align and nid in Rust allocators 
Date: Wed, 25 Jun 2025 08:29:17 +0200
Message-Id: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coming patches provide the ability for Rust allocators to set
NUMA node and large alignment.

Changelog:
v2 -> v3: fixed the build breakage for non-MMU configs

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
