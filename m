Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D91B85EC
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326486; cv=none; b=c5oNeOxRQd8jon1nd9N0eFqcHBuIHIfWX5tIog2lgpN3pNFe0pNuYeE+DpDPvoxheW46/Sl/w22f8Ss218H5C+F3c3xZkde6HAr1I8GWT+wqoqAq0LXXHeKMOujcrc5/BRjCJ/B92mDvfSHMUONr4lpip8uuTeLHWw3S71m/oGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326486; c=relaxed/simple;
	bh=HTjPQxs2wJPTueTcwsNaBCyvNgeRX1Oz2gshXWAVnzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/9Hvbm9kWrCXdZqDmQvXR6jXmt8K2eqgeNBHrYXrrdcUF5rr57+Dl+hJMBC1ucws7Hj5C5Eo5auyiShSR/+S1GQFiNNfbP9h828xf8KKy1O0MhFXPyX8Ee8iriz7vojNaWSGzpbbQsyGdc9THvTZB3Bys7N7pkm3GJQgR6thqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP1/H9Rt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP1/H9Rt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso423816566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738326483; x=1738931283; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ywyi6UD7rqtgXm1cChNDwHtl6jR/rmG4MDMhtqMH1AA=;
        b=WP1/H9RtbdwslMD0bIutMFJnby94UOSjIVHwIhMNbpoMAzFN/pBDu1IQGow5w3x6mw
         qX2HQDsXfCXrriVRjcV7fbI8n6BdAzSnvDzjlmtBziYBNnVhDFnmeLJ2Fg7o8dY7oPVa
         ryir9LhCTV5q76+K47XciA0/1OJdI3Z8sSV4tL1Ehu5KtkkkAZsaG0sKcBAmBH9Ak4oW
         9QfaW0qMlvvA++YsFQYcBp4xYCy0UASGJOxfiQjfx2ePbI7OcjoYqKu7bpuiRwqOCexQ
         piCwWvhQoFN1Zb/LLsML3MXIKq++32CXZQM9nWySG3zKeN92KxC/GfgpbxyvGoDm1MKR
         RnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738326483; x=1738931283;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ywyi6UD7rqtgXm1cChNDwHtl6jR/rmG4MDMhtqMH1AA=;
        b=DcvDq/KrGXRHRoe/udqlJFyTcuN00O0fHO/mbBRw8nAzfVLZMMmOKf9LQIhppZt9z6
         BsFxqd8YSacCGbXgVyZFL78h4aBJKoR1SE9PD/+At/DgcGjmsVy4UdqB7GKvpzrYc2zO
         0OmoiMxrIfCZaMkP6YPz0mAE6MyVMMOoGUBOq8rGnE5dj6NmUrQErCRsJujRcO2WhVZj
         i8ozcUGeLS9X3LOc3m28OOHjJWNr/8P/MT6Fg/BUoSg9mpEcm3NgCrZ6rG4sV/IvZpCk
         y91VGY4qLW45TuFq7RmMEr/2o+Gj9ntRS0JyppbNGVlGa4PkE7Z9SDWHg9Zf4Ik2g1V4
         mtcw==
X-Forwarded-Encrypted: i=1; AJvYcCWurTJONLk1syY1SKQwZA66iWYrfH204qBsc0P/9qBpFP3uz1C0Cc9qC+CBKc+2SBmRU/T9vIamWdLtw5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxkUyhPyHgs9o1JjIAZriacSYSz4MBTFBravNjhNUxzHj75OXt
	OORMLIdgsujYIzSCEBrHrI734Jv+inP0ENJiBgHPm46hCH4WIt13
X-Gm-Gg: ASbGncu9EwVH8wFrXQAMrZchwtCCMwwpVkbJ2EIzQXM7gpVugtkUVMn39Cf7tVqhULq
	iEYQIc5d7fyg6vUsxT4WTwORGh2N+v429laprAwFhZDzMZMo6DgdPmWBc+tQeW0TgThjQE0wk6z
	8rkTv0kmaghMVA/xE0DqIHqg5+ZfYQ2+JZpCsfrIxewPUFXkXpcw27rIfQ2C+00G/Ilfemm/4ap
	3bXCq8ejHkAnjdq1uePpQAAqOZ31NNuyI1gu9oPAo5vU4B3pQKgfhBovPjXknN34UBMUqyamhwF
	8DHGAOcHyiFORLM=
X-Google-Smtp-Source: AGHT+IFY026YOYpMFgU07wmx4azLOjyAYf4Hxy61Vh/kibLKAk506di1UvWIEFX90ZnnvJvvNQob/Q==
X-Received: by 2002:a17:907:7e9b:b0:ab3:8a8a:d1f2 with SMTP id a640c23a62f3a-ab6cfcec5b3mr1216531466b.30.1738326482424;
        Fri, 31 Jan 2025 04:28:02 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31531sm287405166b.141.2025.01.31.04.28.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 04:28:01 -0800 (PST)
Date: Fri, 31 Jan 2025 12:28:01 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Scall <scall@prosemail.net>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
Message-ID: <20250131122801.rb3bid7peznbgxwg@master>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8415a24a-a19e-46f6-bb56-dfd529143dd9@prosemail.net>
User-Agent: NeoMutt/20170113 (1.7.2)

Hi, Scall

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

Is there a public git tree to get the code you do build?

>
>Good news: I learned that the issue has already been solved in the mainline
>version with commit 5059aa6334fcf ("maple_tree: memset maple_big_node as a
>whole") and backporting it is the solution.

Or, is it possible to list the last several commits of file lib/maple_tree.c
so that I can reproduce it on my side.

I guess maybe I can try to reproduce this with:

   * set CONFIG_FRAM_WARN to 1024
   * set KCFLAGS="-O3"

I would try to take a look first.

Is the GCC version matters? I don't have the exact version at hand. Have you
tried other version?

-- 
Wei Yang
Help you, Help me
