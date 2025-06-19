Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753DF20A5EC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323037; cv=none; b=h7oJX/10KOQMnH+ZbvicvsISVle5Xgq53CbzGB33fsubvkj2QGat9t9cxoM2wZLgGrsPy5ddhw1KGE5qikQW5q37HNHTGC/760Ghgn9bRwjRv2jMjyTKIr0iASmQl2FWb6fWUdo50Mar3l5n2EePMXn+Fkimld2xc0tjB0Aomnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323037; c=relaxed/simple;
	bh=3pfdt7Yot1G6GIPYJQDiTdTC8v4G9CVNWbghyEHGA5A=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=A4hqdoBwgnE7+rtN8uCXqSauhLDiyIOzhX9dfIEpC1zmi4lwnyXhpfPL89WKF5biQr5kNEvSv18Mxu4M0+rKrw+Ilp319es7pL3L6ra3Vqziw49mYYRxrmvzPeTwo4/z8YB6P5sxVa9IWxdTc/KPyIir78CpD562MsN8crSbheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNDck1kVXz9tSq;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n3SkZ0cbxug; Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNDck0sP1z9tHZ;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 183538B790;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Y0gL91Rd_iyf; Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CDFC18B78C;
	Thu, 19 Jun 2025 10:42:13 +0200 (CEST)
Message-ID: <6f58923f-5ee2-41c6-bb73-8e0fb9ad9a96@csgroup.eu>
Date: Thu, 19 Jun 2025 10:42:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Daniel Borkmann
 <daniel@iogearbox.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Redundant barrier_nospec() added by commit 74e19ef0ff80 ("uaccess:
 Add speculation barrier to copy_from_user()")
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Dave,

In commit 74e19ef0ff80 ("uaccess: Add speculation barrier to 
copy_from_user()") you add barrier_nospec() to copy_from_user().

There is already a barrier_nospec() in allow_read_from_user() which is 
called by raw_copy_from_user(), see commit 8524e2e76441 
("powerpc/uaccess: Perform barrier_nospec() in KUAP allowance helpers"). 
Why do you need an additional one ?

And why only copy_from_user() and not also other places like 
copy_from_user_iter() for instance ?

Thanks
Christophe

