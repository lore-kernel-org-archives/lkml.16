Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78991E0DB0
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176504; cv=none; b=t1CjIE7zCa811WJVARWXPyiAQI64MgtJEUywjQnx9rJJg2Q05829kwSRgM1GTLlx7+XFLVZR4z0B6xLN9BRIfC7uO/qzq+4ydxGVVyN3ECswUVcVVpUKEW+/0PXbFP6dpYo3awH16qLPZ3aYKthe2zISepqdr3AT0xZ+k18czNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176504; c=relaxed/simple;
	bh=v7t/b1bseEGT07c3FY8utGzEJPHu0vgEf5zHyuSLnLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8gWUrmzVSYpeB1MSyxCewvMbVdiWNcyzIYAEUnZbVlvH/Fnb9JOhQoXdcW0KMbwu7HKKp+AV3bpWmkZKZp9O5MwTyqwP+qve2rhtSeqZwGaNwkFk26Q8YNsInGN79obMxapTEMkULSLNKBU7wJiYoDnXqY0e3dylV/qcRUNr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FbzR/kMJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FbzR/kMJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec61d0f65so5960966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738176501; x=1738781301; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8bf4DZJPP2rSwdY+pwJS8gO4tmZtY2U6WvRvjgGimU=;
        b=FbzR/kMJtT2oum+I1cpgDaUWqu/XhANJYMB0JNw+Q4hmwn/GZczHqCfvIQXIpnBApa
         a1qt2ySDE0UaQgSI7ORxC6TNdBBiBSwXfVbBZyMecQ5bZX104TvLxXWOZ1dQeAAi482T
         JELZKBBXYgZnxsbRMjaCV92tBSBBolRFG2n94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738176501; x=1738781301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8bf4DZJPP2rSwdY+pwJS8gO4tmZtY2U6WvRvjgGimU=;
        b=iw/jjdbbiHas0G69/tkbwDkNYn8zzYaduAHikoxmfXYLeDdnI2RoVkK3QcEoKbXVdf
         vz3cujeW1CIS+5XTVfnwCEGWTHwDkznSD/8bTvuSqVdKw/oqTpxBMs6CCyQlPclwqeBs
         nzLIpxZFd9MNClTojxp19uIFZ5+uvgcHncT/v2M6vl0tl+VCt2DOI4a+dt1mDkOI5Ra5
         REgex7B24yAHc8B18mzPvjKxquqqWiDDAJ97UDpqJri6MA6V9g6Yu31BX9nLBXuIAPLr
         gXQFOwL3T5MmzYArgDqZhMnIUu83nLn0xt4tff9PVJYZHo/KhGXW9Tpf3K6ndcoMsHSM
         BZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLacUB+l7g3m5D436m2N2WV2hqRQMKhCLQiIl51z6FQ5vHV/YG3LcJ4qWIyafQRepIpeWR63/Ws98kuZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmcdojAGlrXkMHGoDfbSGq2QRx58Rmm+lgoPf2PYR1lf1+qE+
	a5HCkBYuHxH/5qfDf5XedV+ER1l9eDlj1tTPyUoKakbpIDowMZ/x+LLzRMrECDJDo7gI2+lm4Bw
	Ft/E=
X-Gm-Gg: ASbGncvJ76Dnjc1+Y83zQTuzsXQWX3gS7uoFcrb+Ka2SwSSAIU2dOnvcbitpc2l5WrO
	jDEbp9V5KDHs1TwtIRIA+Xnxrhj2f9lj4J+Ofbm7kccDHCrZQoxOeudP8LPHeWv5t4khcBdgdPn
	llj7okyK2HnpGT+6QAdp2dum1797V28Rai/jiqR5NcZfj6sWPaeW/Qi3/48Pwr95GqWbwIB+xMj
	A6/RXEVBffoBYSawOM8AVJ8dO09NjG6vXK62z7rCZnJ5FvCmMOwtQmjvC/cBXba/cCNnfsr1W5a
	KhvUa4BogwcxSdGHzYekyENXBIP3NX00UQfCzErR9Jiuz3i7VwP9M6Tu9Qy1eJxtTw==
X-Google-Smtp-Source: AGHT+IHEv0x305LPSGc5mo2g29hAtkV2n25M6AJQ6HLWBaAeVyaQh6+a0hEBwVD9XgN20A8NBIdxCA==
X-Received: by 2002:a17:907:971f:b0:aa6:a844:8791 with SMTP id a640c23a62f3a-ab6cfe120e9mr393214866b.45.1738176500874;
        Wed, 29 Jan 2025 10:48:20 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e11a1esm1018869666b.33.2025.01.29.10.48.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 10:48:19 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so3855266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 10:48:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnYBkeuH0ia7BkJcbwE78+nUuSl0xS0RDTf1D8dF2bFnZ6PJ+ePYqYUWPqofo62PjXV6cBkEbHNN4Wvc8=@vger.kernel.org
X-Received: by 2002:a17:906:da85:b0:ab6:9d92:6d6 with SMTP id
 a640c23a62f3a-ab6cfd0d35dmr415053566b.26.1738176498692; Wed, 29 Jan 2025
 10:48:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <kndlh7lx2gfmz5m3ilwzp7fcsmimsnjgh434hnaro2pmy7evl6@jfui76m22kig>
In-Reply-To: <kndlh7lx2gfmz5m3ilwzp7fcsmimsnjgh434hnaro2pmy7evl6@jfui76m22kig>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jan 2025 10:48:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgNwJ57GtPM_ZUCGeVN5iJt0pxDf96dRwp0KhuVV4Hjpw@mail.gmail.com>
X-Gm-Features: AWEUYZlqaMWdacM1L6lq7K7jLmz8nrxtrZnee6xpSEfGqjffsjadL1gFNvtIh-4
Message-ID: <CAHk-=wgNwJ57GtPM_ZUCGeVN5iJt0pxDf96dRwp0KhuVV4Hjpw@mail.gmail.com>
Subject: Re: [GIT PULL] sysctl constification changes for v6.14-rc1
To: Joel Granados <joel.granados@kernel.org>
Cc: Anna Schumaker <anna.schumaker@oracle.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, 
	Baoquan He <bhe@redhat.com>, "Bill O'Donnell" <bodonnel@redhat.com>, 
	Corey Minyard <cminyard@mvista.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 00:14, Joel Granados <joel.granados@kernel.org> wrote:
>
>   All ctl_table declared outside of functions and that remain unmodified after
>   initialization are const qualified.

Hmm. A quick grep shows

    static struct ctl_table alignment_tbl[5] = {

in arch/csky/abiv1/alignment.c that didn't get converted.

And a couple of rdma drivers (iwcm_ctl_table and ucma_ctl_table), but
maybe those weren't converted due to being in the "net" address space?

Anyway, taken as-is, I'm just noting the lacking cases.

            Linus
