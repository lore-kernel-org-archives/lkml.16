Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCAA23D2AE;
	Fri, 13 Jun 2025 03:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786266; cv=none; b=mXCCoLibGbDyerae20emlOhLrvm6ydbBXBXRuzPfVLgOJrQxMZAsufkpuWYsZPM8VV4cA8CoKB90BGRqeyT2QrlimLkfdaJ1uTBjCInUfFbH+V7idisSU79MotcQiqSdUWl0WEavxdKV9CeqLVvOhoPyWYW+D+ja2TkinCKspBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786266; c=relaxed/simple;
	bh=WWiLEN4g4bvHfCYGGJ1cL9c4K/SFIqfTdeiHePcNoNk=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ZwQe6URuSQ9yDntk3Mlp/xSjm9PDUlOwCF2DFoODjCxpg/Pa/Z8fvPEFqOCpBAjhtkxGqyHZrrElLEEMAwv6DCwy9OE6m+AqnEAZgWdtbuNiZ+1itGT7+4/mByTl2Bo3LNzMOoVNDGPS93iEm6B3UEIF0TpQ1ygt/LO6SuX0ItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bJQHm116Jz8RVF6;
	Fri, 13 Jun 2025 11:44:20 +0800 (CST)
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 55D3iCQe066165;
	Fri, 13 Jun 2025 11:44:12 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 13 Jun 2025 11:44:13 +0800 (CST)
Date: Fri, 13 Jun 2025 11:44:13 +0800 (CST)
X-Zmail-TransId: 2aff684b9e8dffffffffcbc-d4f4e
X-Mailer: Zmail v1.0
Message-ID: <20250613114413940fzngS9J_4rTlJabuvcRv1@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <alexs@kernel.org>, <si.yanteng@linux.dev>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIwqBsaW51eCBuZXh0IDIvM10gRG9jcy96aF9DTjogVHJhbnNsYXRlIHhmcm1fcHJvYy5yc3QKIHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55D3iCQe066165
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 684B9E94.000/4bJQHm116Jz8RVF6

From: Wang Yaxin <wang.yaxin@zte.com.cn>

translate the "xfrm_proc.rst" into Simplified Chinese.

Update to commit 304b44f0d5a4("xfrm: Add dir validation to
 "in" data path lookup")

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
 .../translations/zh_CN/networking/index.rst   |   2 +-
 .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index 4dd75ec27dec..4cf09b60b3f0 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -23,6 +23,7 @@
    msg_zerocopy
    napi.rst
    netif-msg
+   xfrm_proc

 Todolist:

@@ -146,7 +147,6 @@ Todolist:
 *   x25
 *   x25-iface
 *   xfrm_device
-*   xfrm_proc
 *   xfrm_sync
 *   xfrm_sysctl
 *   xdp-rx-metadata
diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
new file mode 100644
index 000000000000..a2ae86c44707
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
@@ -0,0 +1,126 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/xfrm_proc.rst
+
+:翻译:
+
+   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
+
+=================================
+XFRM proc - /proc/net/xfrm_* 文件
+=================================
+
+作者：Masahide NAKAMURA <nakam@linux-ipv6.org>
+
+
+转换统计信息
+------------
+
+`xfrm_proc` 提供一组统计计数器，显示转换过程中丢弃的数据包及其原因。
+这些计数器属于Linux私有MIB的一部分，可通过 `/proc/net/xfrm_stat`
+查看。
+
+入站错误
+~~~~~~~~
+
+XfrmInError:
+	未匹配其他类别的所有错误
+
+XfrmInBufferError:
+	缓冲区不足
+
+XfrmInHdrError:
+	头部错误
+
+XfrmInNoStates:
+	未找到状态
+	（入站SPI、地址或SA的IPsec协议不匹配）
+
+XfrmInStateProtoError:
+	转换协议相关的错误
+	（如SA密钥错误）
+
+XfrmInStateModeError:
+	转换模式相关的错误
+
+XfrmInStateSeqError:
+    序列号错误
+	序列号超出窗口范围
+
+XfrmInStateExpired:
+	状态已过期
+
+XfrmInStateMismatch:
+	状态选项不匹配
+	（如UDP封装类型不匹配）
+
+XfrmInStateInvalid:
+	无效状态
+
+XfrmInTmplMismatch:
+	状态模板不匹配
+	（如入站SA正确但SP规则错误）
+
+XfrmInNoPols:
+	未找到状态的对应策略
+	（如入站SA正确但无SP规则）
+
+XfrmInPolBlock:
+	丢弃的策略
+
+XfrmInPolError:
+	错误的策略
+
+XfrmAcquireError:
+	状态未完全获取即被使用
+
+XfrmFwdHdrError:
+	转发路由禁止
+
+XfrmInStateDirError:
+	状态方向不匹配
+	（输入路径查找到输出状态，预期是输入状态或者无方向）
+
+出站错误
+~~~~~~~~
+XfrmOutError:
+	未匹配其他类别的所有错误
+
+XfrmOutBundleGenError:
+	捆绑包生成错误
+
+XfrmOutBundleCheckError:
+	捆绑包校验错误
+
+XfrmOutNoStates:
+	未找到状态
+
+XfrmOutStateProtoError:
+	转换协议特定错误
+
+XfrmOutStateModeError:
+	转换模式特定错误
+
+XfrmOutStateSeqError:
+	序列号错误
+	（序列号溢出）
+
+XfrmOutStateExpired:
+	状态已过期
+
+XfrmOutPolBlock:
+	丢弃策略
+
+XfrmOutPolDead:
+	失效策略
+
+XfrmOutPolError:
+	错误策略
+
+XfrmOutStateInvalid:
+	无效状态（可能已过期）
+
+XfrmOutStateDirError:
+	状态方向不匹配（输出路径查找到输入状态，预期为输出状态或无方向）
-- 
2.25.1
