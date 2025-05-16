Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7351D5ABA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409881; cv=none; b=p7+qpzG45h0otbnDzwcFjCcGnmQULxRug/yOvm5+4UQ/0PEwsNIZ/2qgQPpLmEIZVKTmJ6cOfnUxAjaUQaxmQqFR38nsPDMYUGt+LtG/w1Vh1PD5dMJ3W7KR773+ue0nxuJ/KdDOEgbwJUquSIUdIhMoCQy4C7sy7D9yk5Urhqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409881; c=relaxed/simple;
	bh=jWNvYz+zqkaA7TqzGqTcYg2figdY5U1juqFUFBIhnks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uBbRbvgrY/OhBHcfb3s4em9bStysMm8W/rr8vW8+RcmTIb9LvX8fEhmfvV69790c+x6mbnxt4J1wjVmmuCpACilJKWohxnU9PWut5NvLw7ask8z8ymB4t8SfVEVpUHwpiID9SbrHklUFpah50Vo1Sw6bvH7ms8XrpsdblTEfBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSWKXFQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSWKXFQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5042C4CEF8;
	Fri, 16 May 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409881;
	bh=jWNvYz+zqkaA7TqzGqTcYg2figdY5U1juqFUFBIhnks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSWKXFQjJHH6DqPAP2ki5ul6F3e3Tn7sIUDEVmsDMZ6wVehQ0p4YUaf2lMiHRYCaP
	 IAkOxSPYYBmZsjrOiMZt0GMNVtCJgUdw4zqfiejVqTUIISYHineeqslDLO7u96XEmU
	 pT3tomaMqHHOnWlV9VSD/t3McW5b5lIFQzfmuKKlfjij2cZsNhzoN8lbr2sZ/7A2W+
	 yV5B38ABa8s41qQ5G68JIvrNF2I6bCD7WsNRlKkoMPd2fbwKkt+FhFT2tNmqzDmRg4
	 27ONeR54uivYUhwxzP35JNHXRUcHa745uR6+XGxBJcZTxgwpEgKBVFRoRCy2qTu8MZ
	 0bySiFZUW7bgw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: Re: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
Date: Fri, 16 May 2025 16:37:46 +0100
Message-Id: <174740461415.2575604.10045637964283416849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508085251.204282-1-gshan@redhat.com>
References: <20250508085251.204282-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 08 May 2025 18:52:51 +1000, Gavin Shan wrote:
> pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
> a positive pmd_val(pmd) according to their definitions like below.
> 
>   #define pmd_val(x)       ((x).pmd)
>   #define pmd_present(pmd) pte_present(pmd_pte(pmd))
>   #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
>   #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
>   #define pte_present_invalid(pte) \
>           ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: Drop redundant check in pmd_trans_huge()
      https://git.kernel.org/arm64/c/13c63ce35883

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
