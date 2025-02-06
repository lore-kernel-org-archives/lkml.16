Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246411DE3A8;
	Thu,  6 Feb 2025 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876089; cv=pass; b=X5cuvMcuI9H9ZL8E+dcL1OwWhVI9sX2rtLwkjD1U6XF/o2/YZM1OUUgeOEG4/ybzx9YPUHSiDkAKbGk8aJuX+re2C8znvDQI8pHwGNLE/3KPsLLKcNJudhbSQBGVh3ozqSTKtkaUB+f2UWqJ8boURe6qf2iwocNbFHWLMEGTOq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876089; c=relaxed/simple;
	bh=1SWPqf8a5C9NxYJR391AEqJrR+BVnwbgc8HdXRPOySI=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=rU/E/vkKi8KPu38D7/w9qTDlZyoH44Ch8puqTp3tM9leX2oaK9VGua2gkSn3mS+tG33cuoiTTwmV1mjTW5HlSijbmBOXzR1jdkUI0CbeT3HUaNtmsVCTAq2+AWYSs5MdmbiWDLTfpxmOUKnDKc6JFuQJBpMZIn2hiS9aDJL3+RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=lyUORO3r reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="lyUORO3r"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5C2742C4C5D;
	Thu,  6 Feb 2025 21:08:04 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (100-127-46-110.trex-nlb.outbound.svc.cluster.local [100.127.46.110])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B954C2C45A4;
	Thu,  6 Feb 2025 21:07:59 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876084; a=rsa-sha256;
	cv=none;
	b=G2h2w9OJ4Kwr70MSNoMgiIaBXXYzjExK6ZIdluCfT55WNbEX/pG+38Uhkg5/afdC1f9Q8N
	rTSjCb4JxqUwKYj611yxCMbHhzy9euIn5DIRa3OCI+Kici2ilR5yog9Stxf5Jgn/wcWGrc
	lp/vJwnMfYAjBS+MNLcEHiAh25BwkW7aKErF7Uz9a1TicpvghRuWlGALEuHJy4Ww/KZfZo
	fSEnMzIZ1x1MVbFH16AkdxkGbdEpyfkYPPhcyg7MDY90FRRm2qhOLu7JBhcPc7VS3pmqbI
	gfcqG3rtJhyAaaliC0hWGSfkMegXSuvs9wDXv9lAcTV9Kx+S0tpo23e+EFUHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=UvSNPkaWPAb3Yryh9T+JjK6uH4K1WVGA5oF6rH2lJLI=;
	b=Q9jLHrbquFe6KLMTo4psb9g8PA0FGpBRNIpy0A4cMrVfKX4sz2a4NZHdlnfS/OtSlQlm+B
	+c92az+UkG30fe4I7VHz4xCOhkxPNEhWoL63TKJDlPYdXv2LPATxzoIj4c7a2XdpYKScuW
	XAay2BMd6k7X5rFf3bqBRhJhNqiU3/10LWOlmGhIQF2G7lX/k6pmakFESHDLdAUm9DeRue
	lMg23CRsMHfuGa0H7xM2WamVOTGKTMOH4Io53979K1awst6R/LF1MP5VEKkPo8LLQ11hga
	OhETeF/GBsVj+bzVep6baBSTtjU127HanB6SKnrXkx/pMTYTKJQUqnghvOvYtA==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-rzbvj;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Callous-Broad: 3b66586c402da879_1738876084222_2093947072
X-MC-Loop-Signature: 1738876084222:3252647735
X-MC-Ingress-Time: 1738876084222
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.46.110 (trex/7.0.2);
	Thu, 06 Feb 2025 21:08:04 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvSNPkaWPAb3Yryh9T+JjK6uH4K1WVGA5oF6rH2lJLI=;
	b=lyUORO3rXo/Pz6Zk2MOggpbgNtccRRUyPlpsWIiwO6SiIFAH5nERMQTGVj+T7ugMRnXl7+
	Pt0X0GyR5WO4chelN5SI6/D4pmYhrw97aTfOAyb69YjfUSmqTbnGyuiy9rjwC6QMHXKwND
	mIq/99riiA1iha+ePHMUjXF/sSjULkOCL058Y6TcaBWEQlbHGK4/htkgo5CEfB2E0oe8MK
	vdoO5CPEdkO4kj4sFI4Vjb2MSSZPZ+lzx0HwrMSalT1e55UFc+A2inSwfPh7kUy3nWBpOv
	Uw7wZCB1uHXykYaGYiFZkJM4ty6lIXvFs8REE7bb0T+QbF7JApqe/COXNEl2rQ==
Subject: [PATCH v3 5/6] rust: workqueue: add missing newline to pr_info!
 examples
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-5-a85273b501ae@invicto.ai>
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 David Gow <davidgow@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alban Kurti <kurti@invicto.ai>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Fox Chen <foxhlchen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=1526;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=1SWPqf8a5C9NxYJR391AEqJrR+BVnwbgc8HdXRPOySI=;
 b=LmrJo+twXvkVHrOjDZszyTqAtMSevdlyJlpzsPHiwXfFkYONoIO5eKkwaAecZshXqxCOn2a+n
 gpbDfzSbxZsCU+cHD/MtVeG0x+K0eYnPHo6+oX/MrokVP7cfrYhfRM7
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:56 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524ad a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=d1_hD_aZrE2QnMCWEikA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfLUMi2wqvpb+tX7MyXm9rUKdWevLEufSMHa+fcmLIMgXIeBRBo98pf4yva//uSDKV2X7jkILyRDM87aYkyyKZ/Zd8zhN7oa398irkTiwLBQ3MEIPQhb+ vpJBj9vg6jn9DQjP3Gl/tizVRkZ/q/YBQw/7dPHmAhTJjEL2gvhrASfhUJyGrFsx6DBIJOW/xQEoRi95UcmAhCjCoamXCmCy2yBKqVEqlfFz3Ped6nRzK7s4 XcvBa8jBPg2rEtv5stSRJL8uSXW15SwQM/p/YAqMKxNQIJaLSB7Dl6fUxRHmmF0hSpw8IthYHQufZKDQOVuH2AEr0fbsv/F/Ol1H2qtr2lw/KsnX1abgiZni JVCWH0yXvWgrvxx0m2RNVRutpkQICYyirfDbilyL5lzyI7EqzT8kN0/oAcIN03jt//rPVXWAqZ1yESzKQSwn9zXeSQkyBAFoipkTkE84EEOYyBdUpOsV02aR zp0fxyNq9Q8Ac5oLm64WPRJvdijTBr61RdRnHgOGrG5KFI5PwptUnIdP4VOiJyz7h59cTh3Zrpz6v/FCIyxLmqFI64PkZf/4qgWLRVIw9tdQc+NJA54Ic3QE I6JgHxSV50ufcXnL/ATSrApNWtmedSo3MhCk25fcVcEdquXOhNZkGPcPRB4Nlq6qYp6eIoia1CUrNXYxvvy+OUa5ivHtM5BiPHJD0xG2bjcFxJt1pye5nTnQ oJbD4LLJLFPM4xx4u8Psy5gA8zKllSRej14lPs8GVxfJ6Wya53rSt4pSB4h0hbPQVgAQF7oVBA3/3WpDevjpJBhLeJrvL2R1nDwjTSyCq/KBQiaBSM/o0Ph4 gtKRuCNpJA4KY5WTphXLWSHwllwES6re9ji7iEeYYNRl5mkIGGCBel2jrNhIWMQPZLypuCM64YWmN+4cHySlW3B9fONQX+hTxzKn9HngNG4qqs86QTvZyiMX LcZpg2+A2JXziSl
 ntCcroZckRcf8PFBdcPXvrvJFpBy3CQGV
X-AuthUser: kurti@invicto.ai

The documentation examples in rust/kernel/workqueue.rs use pr_info!
calls that lack a trailing newline. To maintain consistency with
kernel logging practices, this patch adds the newline to all
affected examples.

Fixes: 15b286d1fd05 ("rust: workqueue: add examples")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 rust/kernel/workqueue.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 1dcd53478edda5fe8cf4e1a034865ecbf70bca79..ebc4b5b4b06db20f57a03b3330f932f279e5d0e9 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -60,7 +60,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The value is: {}", this.value);
+//!         pr_info!("The value is: {}\n", this.value);
 //!     }
 //! }
 //!
@@ -108,7 +108,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The value is: {}", this.value_1);
+//!         pr_info!("The value is: {}\n", this.value_1);
 //!     }
 //! }
 //!
@@ -116,7 +116,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The second value is: {}", this.value_2);
+//!         pr_info!("The second value is: {}\n", this.value_2);
 //!     }
 //! }
 //!

-- 
2.48.1

