Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA626E167;
	Tue, 20 May 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736951; cv=none; b=uD5/7JCr9ipiIkbJNEEY5qLmZIY3kFRcjm1B+x0Tyv3TedliBKvAzdlz/UGEa3BjEHj9Z3mJB4VdDjvy8c2igm7aCjNneYAdUFtA8oYRUruySr/hEtx1PofImL3WJ60G5EP8EcQbKf31X9LQsmAyNs7Ly820Kpl6grDcd//1Bvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736951; c=relaxed/simple;
	bh=n1/N84FGPvJ0N7dn/KQSt8LMWrvxmEIlbBp0ODZnP8A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lEZ0aS6nuMEy165foKpJdSqC/DNgMz61XGcdio0Ik5zYmilAy8Nf1ifayKzQLDsjL/n3sX7KRJMuOBu+izXEDdhnsPAH1taztKoVAJnrFqgsE5inr1zPjPNvk//MCaFcm7bSNWyKCyLNp2Gsv3e5qiSd2XOtwOlJUD8jeEXyA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=qxN+37x0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="qxN+37x0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1747736939;
	bh=7jOe1qDYuPcz7q3O2yaxSQ02D4UR7czAnJDhSuRfs6A=;
	h=From:To:Subject:Date:From;
	b=qxN+37x0LWPEzCiV/P+gUaZs3P8diJ3DDn/NwGFHhTs68e+obQH2/SymkM4qNiMzz
	 8z7IZP6NhQhTUmcEyG/IxZREPKUHR1HZ2CRyzL8fmhMqP0taAwKlvXzfpDGOSI/Dwl
	 /noxVzrMmYyyadvMQUn6OdRB9GfT1YSgIr0Ge631FmNTQ/Bf20Hq7kZY5PeLM5Tli6
	 lGqMwsSUDAP8Y/epOo2EABgTNqyZq7P1ECs9ujTqHxV6t938eqIpsz6gRVVwc6rBKf
	 ps/U9DUn++Nz0gRzoUm6ZPNUn99Vs8wC3UAqfNfP3TelQcRq4pSzpNTom7uIvCzsh8
	 M0uQ4O1Hskukw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1rPl6GgLz4wxh;
	Tue, 20 May 2025 20:28:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Remove myself
Date: Tue, 20 May 2025 20:28:55 +1000
Message-ID: <8734czh8yg.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I'm no longer able to perform this role since I left IBM.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/process/embargoed-hardware-issues.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 0e19d2f0d6bb..da6bf0f6d01e 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -290,7 +290,6 @@ an involved disclosed party. The current ambassadors list:
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
-  IBM Power	Michael Ellerman <ellerman@au.ibm.com>
   IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
-- 
2.47.1

