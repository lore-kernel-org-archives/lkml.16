Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A6D27BF6D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747419525; cv=none; b=tNuGTTSpdugHQlo0vSL4imSS4h0IpS5m3hrNlK4Y5+u65ROQlK3LVWs30nX4Kfj1FRIgFzYiQ+oMwtcBncmcz3nu4R7P35B+eqw593MBe3cERr44/iTxUM+3Plf9CIABH3mlwq3HSO/+BuPbVBMQGRU0DR/7Zn1CJwonlAQLAIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747419525; c=relaxed/simple;
	bh=1Fxd+qC7uWpj//eTtsHg0v7PrQYpCgJTTZVHY52vEEU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qA7IXEKCXLdzeQDGiN1bN4kZsvzB8YWuysES8nRukyNPMXm7w/imtH8DwZTHb18VWhcV4NFEFjXe2V+uE7zLDiGXWVMg3TqYWu3eP3iPOwcj3WY9Gn8CsH0lNSCNc1VmZMUhvsXeKh5Y8BJFaSxwtWWmCPtCf7KfvQKwGbeQqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=SLQMoH9R; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="SLQMoH9R"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54GIHaJ2182852
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 16 May 2025 11:17:37 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54GIHaJ2182852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747419458;
	bh=DN7GoGlEVhJjpJzviIeG+uQIMPRCenRs1COSx32r02c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=SLQMoH9RpeKo88jQBZ/a2dzxQy9beauJvO+zsqPPuSAD7GsHgjCC1QrioG32PCtxo
	 XNSCSEWbbxQGuX0L9ZbN/DIQYtBhWmMvrP88ADyLhTpEvui64uG4JuCweGU/SWee+6
	 BX8jKrX0K9BexlAJK7/ZCfebxm8hSV0wqS2RfvTqDNnoUfafQz3+ZNf0bPQgzJg+XV
	 S7afqUO5stPiPuxwBma6VVe64g5RV9CsP775kIKj0UyVLq6+OsZbXCBf46SPFcJ/dT
	 esZ3nFfm633UWICtGqcXqMD2Z+oCA6k/RSJxYDejVRE9mV1NLFsZ90qLeLGzcN0jVL
	 QXgvbCrtcqrmA==
Date: Fri, 16 May 2025 11:17:35 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_32/32=5D_x86/boot/e820=3A_Move_index_incr?=
 =?US-ASCII?Q?ements_outside_accessors_in_e820=5F=5Fupdate=5Ftable=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250515120549.2820541-33-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org> <20250515120549.2820541-33-mingo@kernel.org>
Message-ID: <77BD029B-35BF-4033-8CCD-DFD0752237D6@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 15, 2025 5:05:48 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>This kind of code:
>
>	change_point[chg_idx++]->entry  =3D &entries[idx];
>
>Can be a bit confusing to human readers, and GCC-15 started
>warning about these patterns=2E
>
>Move the index increment outside the accessor=2E
>
>Suggested-by: Andy Shevchenko <andy@kernel=2Eorg>
>Signed-off-by: Ingo Molnar <mingo@kernel=2Eorg>
>Cc: Arnd Bergmann <arnd@kernel=2Eorg>
>Cc: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Cc: H=2E Peter Anvin <hpa@zytor=2Ecom>
>Cc: Kees Cook <keescook@chromium=2Eorg>
>Cc: Linus Torvalds <torvalds@linux-foundation=2Eorg>
>Cc: Mike Rapoport (Microsoft) <rppt@kernel=2Eorg>
>---
> arch/x86/kernel/e820=2Ec | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/arch/x86/kernel/e820=2Ec b/arch/x86/kernel/e820=2Ec
>index 10c6e7dc72d7=2E=2Eafb312620c82 100644
>--- a/arch/x86/kernel/e820=2Ec
>+++ b/arch/x86/kernel/e820=2Ec
>@@ -421,9 +421,11 @@ __init int e820__update_table(struct e820_table *tab=
le)
> 	for (idx =3D 0; idx < table->nr_entries; idx++)	{
> 		if (entries[idx]=2Esize !=3D 0) {
> 			change_point[chg_idx]->addr	=3D entries[idx]=2Eaddr;
>-			change_point[chg_idx++]->entry	=3D &entries[idx];
>+			change_point[chg_idx]->entry	=3D &entries[idx];
>+			chg_idx++;
> 			change_point[chg_idx]->addr	=3D entries[idx]=2Eaddr + entries[idx]=2E=
size;
>-			change_point[chg_idx++]->entry	=3D &entries[idx];
>+			change_point[chg_idx]->entry	=3D &entries[idx];
>+			chg_idx++;
> 		}
> 	}
> 	chg_nr =3D chg_idx;

Really? That seems easier to miss to me=2E
