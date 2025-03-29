Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F992AF06
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743209839; cv=none; b=tm/AiYLDlbT7AFHFCJjX/dPFlif1F9iEKs6Hq85vkRoJHnEKfMR0lRzN8+idgI4bogdHbFPeMAOckSc7l7lvOcVadptMQb+sO8SSRSuOB3+EfkprvtufuUC6MbDipp6cUV2jJUP8oBLW79SkGpinMuvpdysWDk4hdxfrVrO8qGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743209839; c=relaxed/simple;
	bh=/HXqLAbYL8OxJv1+jtBTDVDCVttnwWhMoe+zMeNBzvo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=goRplQfz43UCnvjnTM3/2gwYUYt8auq5vEEcoqTvct3lPZHtcAiytL1T1NZz0ppWoODZkHzg3137wZk2S7oRn5B80qSL/3JV87/Ogb9po/XxcQftz6M/0VlQkc2BFwAWUEQ5egI7RtdVzA+NvGkXxYPuKcu2/1Kh/SJRU2QXUew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=eSi2nKrF; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="eSi2nKrF"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52T0unOl2178034
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 28 Mar 2025 17:56:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52T0unOl2178034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743209810;
	bh=SUPUJLD7U9KrEob6dDvKWs7s1yF+3jqtiGoOlaEMlFI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=eSi2nKrF7aRpTIsLCpkhcsvi+ME9VY/qLGKSZc+k2J368uVP9khGQ8fbOjhfIZUNZ
	 +oPWFrXAp/r8Eog/Vjr6lG/a93o8odt6YU+LAWQblfHrugFXS0nCBXgwmQ6fWbJRt2
	 icSDLttUBvAN5wkdCfVnZiteCCvCyFohwGjCS/+5JWiNFLwOOpvAVuAIcL0TVJ8eHW
	 iEQg58DKI7pvzXHr0l7ozCJ+yzW/lkA3BVIuMpjfabubo3fr5LYEykHCBPWl5oKMNE
	 xe0rYA9KTTOYDP1eLG97ZDAqjSmsKkEQ5ClKWm/1r2+Dzk/ehsJj7ieRaM/WS9SWGz
	 Hyxw+ZEl7z8sA==
Date: Fri, 28 Mar 2025 17:56:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>, "Xin Li (Intel)" <xin@zytor.com>,
        "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Btip=3A_x86/core=5D_x86/c?=
 =?US-ASCII?Q?pufeatures=3A_Generate_the_=3C?=
 =?US-ASCII?Q?asm/cpufeaturemasks=2Eh=3E_header_based_on_build_config?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
References: <20250305184725.3341760-3-xin@zytor.com> <174238223959.14745.6970497940010271580.tip-bot2@tip-bot2> <SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com> <CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com> <SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com> <20250328162311.08134fa6@kernel.org> <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
Message-ID: <69F3FAF7-7F30-4740-A536-672DB6A2372D@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 28, 2025 5:14:25 PM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Fri, 28 Mar 2025 at 16:23, Jakub Kicinski <kuba@kernel=2Eorg> wrote:
>>
>> FWIW this also makes netdev CI melt down=2E Combination of allmodconfig
>> insisting on WERROR, us insisting on W=3D1, and this change insisting o=
n
>> full kernel rebuild every time =2Econfig is touched :( IOW we do:
>>
>>         make allmodconfig
>>         =2E/scripts/config -d werror
>>         make -j W=3D1
>>
>> Could a hack like this fly? I don't see an easy way out =2E=2E
>
>Ok, clearly we need something like this=2E
>
>That said, your patch makes my skin crawl a bit=2E Not because it's
>wrong, but because it really makes me think "why don't we have this as
>part of our normal "cmd_gen_" infrastructure?
>
>In fact, we *do* have something like that for our infrastructure: it's
>the 'filechk' macro=2E
>
>So I think the real fix is something like this ENTIRELY UNTESTED
>patch=2E  Whitespace-damaged again to make sure people don't apply this
>mindlessly, it needs more thought:
>
>   arch/x86/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>  index 0fc7e8fd1a2e=2E=2E769b29bf26ba 100644
>  --- a/arch/x86/Makefile
>  +++ b/arch/x86/Makefile
>  @@ -278,11 +278,11 @@ cpufeaturemasks=2Eawk :=3D
>$(srctree)/arch/x86/tools/cpufeaturemasks=2Eawk
>   cpufeatures_hdr :=3D $(srctree)/arch/x86/include/asm/cpufeatures=2Eh
>   targets +=3D $(cpufeaturemasks=2Ehdr)
>   quiet_cmd_gen_featuremasks =3D GEN     $@
>  -      cmd_gen_featuremasks =3D $(AWK) -f $(cpufeaturemasks=2Eawk)
>$(cpufeatures_hdr) $(KCONFIG_CONFIG) > $@
>  +      filechk_featuremasks =3D $(AWK) -f $(cpufeaturemasks=2Eawk)
>$(cpufeatures_hdr) $(KCONFIG_CONFIG)
>
>   $(cpufeaturemasks=2Ehdr): $(cpufeaturemasks=2Eawk) $(cpufeatures_hdr)
>$(KCONFIG_CONFIG) FORCE
>        $(shell mkdir -p $(dir $@))
>  -     $(call if_changed,gen_featuremasks)
>  +     $(call filechk,featuremasks)
>   archprepare: $(cpufeaturemasks=2Ehdr)
>
>   ###
>
>does something like that work? (And really: note the "something like
>that" part, this may be *entirely* broken)
>
>             Linus

This also points out a need here: the header generator output probably sho=
uld suffer replace-if-changed=2E Too bad we have to use such primitive tool=
s :(
