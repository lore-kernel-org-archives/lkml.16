Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDD82882C9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443918; cv=none; b=Z+dUr+JHqxzHeQTsrpqPLrm61WRalCCg3jfW8UuMPVT26AKP4m4q4TNqWayB1GFO7O1MOywLP+9EBGQtIUmTuaW5YEcguV6hwJnLYCvtnjnQlGYXdjSO6y6Diroi00XKb78DBvVUWr/O95yCgeef1j+TVl5auPXu+oF17BM1RzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443918; c=relaxed/simple;
	bh=2U9xGHLfs43eXnefr/kglRjJiDhQ2/XDV4dJJI/1diU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjCO2W9KT5FptilK58QJuzo9i4kPn8hV29f+0mQ7uaPDQNOzmlXQyCoTVMTlQm0DjtP5mDN+LCFMYmgThWanmh6zGfODjcKeRYgRpo58ReS3TU+xAc+Gpx1sfQw99RJrngq4bS0QwlhXwm1JlYyCyx0OaHPznQaxqG8ulJ2ibl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 477DE1A2D;
	Wed, 28 May 2025 07:51:38 -0700 (PDT)
Received: from [10.57.94.142] (unknown [10.57.94.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB6363F5A1;
	Wed, 28 May 2025 07:51:52 -0700 (PDT)
Message-ID: <70f0abde-24a1-4016-9a69-cc341e9ef6af@arm.com>
Date: Wed, 28 May 2025 15:51:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
 <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
 <e1ff054e-bfaf-48d1-9d6f-46ea73d09ac9@lucifer.local>
 <c5df4570-84a6-430a-ba49-81cf75930c16@ghiti.fr>
 <a42e05b9-7568-4ebd-8797-c635c07d1884@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a42e05b9-7568-4ebd-8797-c635c07d1884@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 10:37, Lorenzo Stoakes wrote:

[...]

>>>
>>> And who would you sensibly propose for M's and R's?
>>
>>
>> Ryan is definitely a M, I would be happy to help as M too but if needed, a R
>> is enough for me.
> 
> Ryan understands this area better than I do, so I would say it's up to him as to
> whether he thinks this makes sense.

I'd certainly like to be an R. I'd prefer not to sign up for M right now though,
unless there is nobody else willing to take it on.

