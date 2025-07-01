Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D8E242D8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367483; cv=none; b=BQSp3DFNR7Xs5wqfjgguoNpI5gN7m6Jo3lSaIvX9+VGmA+D8eRJDgg6epqPWJvdwkbzJPI0Dx59KjHYK6yWKvG2sOBrV7TxtWB1zqmYI0wqAz2PUCqRbPUnqGo9pBRtDGmWeTdlb/vlKzcygEAFGbWCZEEh9GHZq1I5shSVd1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367483; c=relaxed/simple;
	bh=69skJtRKFUn7zDpOwVUIh2uP80P8co6NUJyIRIhpXI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jUFANGPtPSNAPYsxgiP8bJUHwLXZcrLgk3x6f7nI8fHl3d4ljhXBHGx17yFz7lfPtD2WPhSdUV9Kd0fKiyHLhE1QvdlsZRW9hmlfH+Y1ZWurXwOEDjmJGk6cwtAL/yNqqZvIKPE2xxTcwqI7k6wl205irfwDKeF4BUC+TEPu8Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNC++AjB; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNC++AjB"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so2368940f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751367481; x=1751972281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pmXumBMClvdmoqj3ckb+e8tnZlkJ8riF+IbGt1/2Y=;
        b=gNC++AjBDRTU8vWbHK1bvP+9xNR1MBDe+6oLJmUXyPTL+olnvdTxDAb1TAxU5OgG1/
         zDKELBL2UasyHzJsgsX9BqRMSIxPHxgxKYAjynYVylw2dG4GPRvHs7itffd2DnhjpjCp
         QFoBpD1iB9pkFPXQQ5dtLxYKfN5Do66Y8cTaWfuP0ZaA2sIsVbeyZqpH95in0NvbYbYz
         oNazhGc33pFYQuxp9CHLPjb/+FCCqJ9K6ErpxHyHAGKeyeGd/mG5im6RlBBknb3iRNfE
         4Vsn7L4FA4eMQ5LjbUEBgeUCG8BZ4gW0sP5NBUAe6EdLyf0Vvps0xXl9bByfym5eCepf
         mSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367481; x=1751972281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pmXumBMClvdmoqj3ckb+e8tnZlkJ8riF+IbGt1/2Y=;
        b=oXHsLnsQVC3KmGke7EKxsjHrXRvA+bYzBHW84ILn19pN9SrQv2nSh3JZ+uF14HuZ8D
         IRacNUfymbxBd/xAYKj8EBSxFH+btJorc7WZVe+T47duADPTCgxiDEqDthdZ3qhlJ4Xl
         CCLWKPc2WxzMvThNpYh1AEVeDdlxqNKN4yUC/aRsnEZfcWpbA+GNV6V5s2OCNKrWo/B0
         nxUdmKK7cFBYOx+WC/FaT1ImVodxyMXtWHNv1wEs78qWOGP5uj4iDawMf72fjFTYSrly
         2XsQ03VTCsUeZ84YoTPUMpiHDYARAtgM/Y9DSdxPDJyb0AT6ribJbB+c3nI4mC2z8PXz
         TeGw==
X-Forwarded-Encrypted: i=1; AJvYcCVTBWF5daNLPiXMFA4HVBcOS/88Ayoe2km3LcBHKaZJuNY7CARHszMttvVCUh9D22v0oQm3rPvIaklmO3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxPJdfL79Ed+d0yTXlf4FPxmXX9VI+Q2JfKyrz9RSfNxx51j4X
	zoifGzNRP7UGVtZ1ld4s3Zkke8BtcCwmTv9Ow3i1QxLmu+hAfcraDImVdyvoGNai1sEyRcusBRJ
	/BvQjrMkdvSuf9oeiPw==
X-Google-Smtp-Source: AGHT+IHVJRVexX67i++8eKSxECLv2YKxZWXGbP3lemNbo7XVNq6X7mdBDqKPr9CZGLFA4uVb+aCZ/DJFXDtvSzw=
X-Received: from wmth7.prod.google.com ([2002:a05:600c:8b67:b0:453:910:1a18])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2905:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a8fda34e30mr15196967f8f.25.1751367480898;
 Tue, 01 Jul 2025 03:58:00 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:57:59 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Message-ID: <aGO_N9fjmUGZ5JVx@google.com>
Subject: Re: [PATCH v8 0/6] rust: DebugFS Bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 27, 2025 at 11:18:23PM +0000, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> module using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Looks good to me!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
