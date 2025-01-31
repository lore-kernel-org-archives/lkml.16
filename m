Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DF71AB51F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330660; cv=none; b=uQaOHnycLXtVMANYDx3U9OOGxZCD3YRE2dJZhsq02Wh+uROOqWOpnfHlt3g1vzBWirN/S3oAeqr76sXsRmUo+LRyPqJN9aLA9A21rgYN7wbfuw2u4w3Dszvvj31L8totoIWyDWhhuF/M8GJE88M0Ef2Ffuyn3B6oQA1ELqlCdxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330660; c=relaxed/simple;
	bh=h/ZelygWL3a1V2GujnyQwTkmfg3Pz8ZtO0W8Xob95VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOVP7IGi11GRppRvYvR1zR3YvM52k4Dnmfm4xsxYc0a2YCvllR9XXH69ynGzTjcdNrmRyQpD9n7ERMuTJ9Il0WBk52sHosvWpY5x4AqnmWbVi8l5tMDbriCzuYIxT2dHLy4YaBL/Rb/r37aJ8X7l2Uhbym2uzbHKq3FuRs9sQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khjrI4vx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khjrI4vx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so325213766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 05:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738330656; x=1738935456; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KL8MD1NKi5Kp1HdAX5m1x264K8h76Izz6Dk3tIwqzIw=;
        b=khjrI4vx32Sliuu4Uqpafs5HD0GndfsKy0YAkIT389vShNMdtf0XGrJGPLWJQHa0/i
         HZGfqQyEwqwnpZ97j0bLIKI31fySUbcLCzpWCC5oiBCCsUCNGCLnbSy+ep3IGAYe9SLA
         OKl/J9tVqJoFImn0Mp1WuKxlQc3PcCsnAlYBJSAOtTnRD82s4g064WMWwl2qu2wlXkmy
         IaL6MS//nKG8CHzMq6bDPAy5ye4YBerbMatiymcikjM+FdH/KqYRB+qBb0Z8xD4b9vOi
         ib79s39cbSiDoqTKfRVLKNRHmpE8LJbBv5tJ9Ea98hydXuewBvd8ohLVO7wAVpP+uv8H
         rktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738330656; x=1738935456;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL8MD1NKi5Kp1HdAX5m1x264K8h76Izz6Dk3tIwqzIw=;
        b=Jph+TXbBHyLTV3iUemZUN10v8TKSnJWJ8yzTxbwDw+m6RR9Cs80D0R2n3yjC1A0nud
         esviNvsMxPJ2k8lyYLVbGAfnBMNB08U7WTAzXYY1yREma1+j6SgXKQw6RgiCLqXu5BdD
         F37jqIYcUQHM13gp08H6pFbDhZdOyL2PWubz2Q9CQo7swtPVFO8TM7B62r0MgmmYf0Lt
         EntNhjchwqeTrVdcamRZ3H3YEztK7lMyaRsBhBpmDMgx2qPJfqhTXtULgU8RfIj9Xoma
         W9yKUWSw61EP+18zkUlpwRdRIUN/TdmS7Z574G+cvwVDl1kvICWLmIjE7ytBSZmy8yAj
         iPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL6AqdeKrh4lTG9mKT1ooYqfZ0/mcpS+xRxsmG37Ptd3uSvsg9GIm0bH4ImR5r6Sf32axdqg4D/ouDusA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgREhIlP7gTp26elq+6Ommojec+i9ZDURfhPxgyPZXeret9VE
	SPFD6KnoZ1mFo+LEwGGwwKFmr2ZDgAvripYbuh1Qt8uK17yc/zp0
X-Gm-Gg: ASbGncvVxYvEWQ4Z4cko289H2XcolRhrsV8crBiVJ5qDckfDZVNyx7gJlOXyhVT8Rs2
	4bVkFabCJlcm0YZKh9lqisn/i4tEz0ykuXHbwlmAQYGahKNf6Ta67GK/zrHncwyfMnVKVfBW+qN
	l70xTLPsu+zTG1SJrSejydv+MMrpauo4oRmCrarsq03gmdqGq/LfVSXI2LVN1yjA5PgexLGkkWw
	4XSONYlWh6EMrf3ObR3fL2hIc71qi81csftb5q0gyWD5DsHlNKBUZEtKGNdNwKGpJG3MIVBEbm1
	iLov/qxga3MaBII=
X-Google-Smtp-Source: AGHT+IF2W7aAOJVH3+FqAJqE+0MqXHfnq5oQZgvkMNzpw0sa7H3db6k7tjBn6EmA1TENHLsDPRxUPg==
X-Received: by 2002:a17:906:7951:b0:ab6:f4df:a3d5 with SMTP id a640c23a62f3a-ab6f4dfa494mr471025566b.3.1738330656226;
        Fri, 31 Jan 2025 05:37:36 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0dfasm300669766b.71.2025.01.31.05.37.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 05:37:35 -0800 (PST)
Date: Fri, 31 Jan 2025 13:37:35 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Scall <scall@prosemail.net>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
Message-ID: <20250131133735.hq6kwncyb5uibe7j@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
 <hxxufpccovvtnoypt4bukrpt4qrhiydlena5tdxqdxpmlduiii@2wac57fy4mqj>
 <8415a24a-a19e-46f6-bb56-dfd529143dd9@prosemail.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8415a24a-a19e-46f6-bb56-dfd529143dd9@prosemail.net>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jan 30, 2025 at 11:31:50PM +0100, Scall wrote:
>On 1/30/25 5:13 PM, Liam R. Howlett wrote:
>> Do you have KASAN or lock debugging on?
>
>No, I don't.
>
>> Does the issue go away when reverting 8c7904a8cd0df ("maple_tree: i is
>> always less than or equal to mas_end") ?
>
>That commit has not been backported to the kernel version I tried to build
>(6.12.11, currently the latest stable version).
>
>Good news: I learned that the issue has already been solved in the mainline
>version with commit 5059aa6334fcf ("maple_tree: memset maple_big_node as a
>whole") and backporting it is the solution.

Hmm... I tried to reproduce this and found different gcc version may behave
differently. An old version doesn't report warning while a later version does.

With GCC 8.2.1, the latest master looks good. Even I use -O3.

    7004a2e46d16 2025-01-22 Merge tag 'linux_kselftest-nolibc-6.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

But with GCC 11.4.0(I don't have the exact version as yours), the latest
master still get a warning. But the message is a little bit different from
yours:

  lib/maple_tree.c: In function ‘mas_wr_spanning_store’:
  lib/maple_tree.c:3804:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   3804 | }
        | ^
  lib/maple_tree.c: In function ‘mas_wr_bnode’:
  lib/maple_tree.c:4065:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   4065 | }
        | ^

Then I tried to bisect it. And found similar warning even at the first maple
tree commit 54a611b60590 ("Maple Tree: add new data structure"). Below is the
warning message:

  lib/maple_tree.c: In function ‘mas_wr_spanning_store.isra’:
  lib/maple_tree.c:4047:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   4047 | }
        | ^
  lib/maple_tree.c: In function ‘mas_wr_bnode’:
  lib/maple_tree.c:4325:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   4325 | }
        | ^

Hi, Liam

Do you have some suggestion on what I can do to help?

-- 
Wei Yang
Help you, Help me
