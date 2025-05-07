Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3F4B1E7F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660457; cv=none; b=kS8kYy0Ql7BUs4VUheZLXYysG51zkLU9r/kyI3lAxgIBI1dd9jqzjPELR7Gio6STvzxGQyzl3sgroq/2Z15CkT6Ypy1w8U+8PNoL7JK3GY3HKb/gFOQui7YjEM9WhPMUWTS8WkydZpBI2IrJojnxPc0kvTqp6drkwSZLm7oTL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660457; c=relaxed/simple;
	bh=oDx0wHcO+DD5D7azeNORUwz06mZQpBHOv9HaDpBcg4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zo0G+WNoUyR0uRvfzKnMHj0avfR+Dj6Bo1vYLs2ulqz39dEtrLdN7liLdBSu2TwVlmZhyuVviLUgp1sRpprODdayieQPS6LtkAU37jX00l5p1IubdGmaokbZJkbewmQfn+56Lkw0kaO9y9srreIwGLChk4Fym2D5rFsEBhJDSdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0FKFc1SV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0FKFc1SV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e42641d7cso80645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746660455; x=1747265255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z3v3xFar2ZxXr88c0qU7tc09Ky2vx+/ATZiiztj96Xw=;
        b=0FKFc1SVBxyTpjOAKmPVKEZy2n6u1Betgcg3E/JN3cYidENmAD2WVdGLWdzymzRVTk
         XXnQ7rdU16wPtxHrvjMyMDKxe39w2EOUHv5KAyhVGwxb9Fq7vgz5o+t5Hm7RKtDFc60v
         KvtLbm27Iy1YPDSxNl6a+tQneTp9+T1J5vxPq12BH7zxxI0PhW8TqRka5H4hfjpm1uzR
         yKDeDdkNVfw6/CX2j13uUcfqd0KrEZzQ/a0BZdboscsFaZcTMXkyPS1D86VC2aBFBhKu
         lLT9rHLjnbBVZalWb9yiDbQ4S3edge3WApX/g09QhrbDAuGjzxm7lhXgXEMW8EOKYJYZ
         QhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746660455; x=1747265255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3v3xFar2ZxXr88c0qU7tc09Ky2vx+/ATZiiztj96Xw=;
        b=BNp1A50+MNVGOjZp/m3mkgKpybNghg4CAIWDVop+zvxlDDKPLvy2VJTTbYl++Y+3Ed
         mKW1btNH+1PWwQh22nKUwzSvo1daQOwZYDm0ZWiudgKktKblPYB7/mHKnfhhMlTZGWmo
         iali+X3hcKbNG1E+PsZQq09HuxX0aCsuH6J2TgF7Ulh+ve42TEaPnwRYj1vLsHOHKDKQ
         hAL5zAO51XjhtNH+Odlv760Fogx7ZUH6150eRqYDBgwxnMW0GKJf2LvTnkWS7NbqRWZs
         3viXG9o/iatK1is3d3Q6sRJjZmmMoylQ+BL9PHl4SrHwxDA0wsnlCwrgLo+43I9JVWEI
         vm3w==
X-Forwarded-Encrypted: i=1; AJvYcCWYw3ClE9OaGqznhuXOF3m/dOpKp+OM7u4ybaGtt0evvk64hGg7MMsxgedHGjCh3MwGSBbXKsxMuGXQ3Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k0gBUL3+m6RcDZcdom8uLX9FoARJFT/eQz4a5sfyn6pujmtJ
	I/QHTx/hF6xRfWyzM/XdRfWQ1Wfu/mJ/srrm0wAQw5U/gRrYof2km2NxnunWEA==
X-Gm-Gg: ASbGnctRJAIzJMchDzI7jFK9MArEUbbUSU/iUq2xcovNksRkGcGc/p5Kjk5hcpDH8Rb
	K/EfPMUo6vVPwu+5xWnK/81/WmafygRQnbJvBJsm64Kh5Grlj9UzzZ+ED/U1dzKlNecCbske13s
	Oow1xal0eOS3eg1JoMSnQKsJLkOw1nUR/NHQdmd/ff0M0xF4xJ0rcpyqSbgM7aLwOYOCrMw9me7
	W9I39E9G9IleCB4Oz84CxZvZUpJGwXVWEDtbDel/IM6dPnKKcWbNEOS0q6hZfCJr54D1WWs+Xmn
	u/mWK7xCyGnWWFXlFVmKA0qJoAyEdofZi7ruYnc5qVv8YJJ7vrEr4TezPjcjdv1yDtaz8czZUg=
	=
X-Google-Smtp-Source: AGHT+IHZdCYmv/mIFIaU8fbtyzPMdwXg0Ff5qWAvl8yP6x/UCV3xIwsCk34nL8VYLFQCA2NvfZq6Uw==
X-Received: by 2002:a17:902:dac8:b0:223:23d7:ee6e with SMTP id d9443c01a7336-22f9f6c9df0mr460235ad.3.1746660455386;
        Wed, 07 May 2025 16:27:35 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d536bbsm832430a91.25.2025.05.07.16.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:27:34 -0700 (PDT)
Date: Wed, 7 May 2025 23:27:30 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 2/2] binder: Create safe versions of binder log files
Message-ID: <aBvsYmqnMZnK-Aoh@google.com>
References: <20250507211005.449435-3-ynaffit@google.com>
 <20250507211005.449435-4-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211005.449435-4-ynaffit@google.com>

On Wed, May 07, 2025 at 09:10:06PM +0000, Tiffany Y. Yang wrote:
> Binder defines several seq_files that can be accessed via debugfs or
> binderfs. Some of these files (e.g., 'state' and 'transactions')
> contain more granular information about binder's internal state that
> is helpful for debugging, but they also leak userspace address data
> through user-defined 'cookie' or 'ptr' values. Consequently, access
> to these files must be heavily restricted.
> 
> Add two new files, 'state_hashed' and 'transactions_hashed', that
> reproduce the information in the original files but use the kernel's
> raw pointer obfuscation to hash any potential user addresses. This
> approach allows systems to grant broader access to the new files
> without having to change the security policy around the existing ones.
> 
> In practice, userspace populates these fields with user addresses, but
> within the driver, these values only serve as unique identifiers for
> their associated binder objects. Consequently, binder logs can
> obfuscate these values and still retain meaning. While this strategy
> prevents leaking information about the userspace memory layout in the
> existing log files, it also decouples log messages about binder
> objects from their user-defined identifiers.
> 
> Acked-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---
> ---
> V2->V3: Cast binder_uintptr_t to long before casting to ptr

I just tried a W=1 build and I confirm it fixes the 32bit warn. Thanks!

Tested-by: Carlos Llamas <cmllamas@google.com>
